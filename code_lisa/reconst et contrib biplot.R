##################################################"
## reconst.coa reconstitue le tableau original Nij
## ici on reconstitue les ecarts entre pij observé et théorique pi.p.j
## (pij - pi.p.j) pour reconst_afc ou normés par le chi2 ((pij - pi.p.j)/pi.p.j)) pour reconst_afc2
##################################################"

library(ade4)

reconst_afc <- function (dudi, nf = 1, ...) 
{
    ## reconst (pij - pi.p.j)/pi.p.j
    if (!inherits(dudi, "dudi")) 
        stop("Object of class 'dudi' expected")
    if (nf > dudi$nf) 
        stop(paste(nf, "factors need >", dudi$nf, "factors available\n"))
    if (!inherits(dudi, "coa")) 
        stop("Object of class 'dudi' expected")
    pl <- dudi$lw
    pc <- dudi$cw
    n <- dudi$N
    #res0 <- outer(pl, pc) * n
    res0 <- matrix(1, length(pl), length(pl))
    res <- data.frame(res0-1)
    names(res) <- names(dudi$tab)
    row.names(res) <- row.names(dudi$tab)
    #res0 <- outer(pl, pc) * n
    if (nf == 0) 
        return(res)
    for (i in 1:nf) {
        xli <- dudi$li[, i]
        yc1 <- dudi$c1[, i]
        res <- res + outer(xli, yc1) * res0
    }
    return(res)
} 


reconst_afc2 <- function (dudi, nf = 1, ...) 
{
    ## reconst (pij - pi.p.j)
    if (!inherits(dudi, "dudi")) 
        stop("Object of class 'dudi' expected")
    if (nf > dudi$nf) 
        stop(paste(nf, "factors need >", dudi$nf, "factors available\n"))
    if (!inherits(dudi, "coa")) 
        stop("Object of class 'dudi' expected")
    pl <- dudi$lw
    pc <- dudi$cw
    n <- dudi$N
    res0 <- outer(pl, pc) * n
    res <- data.frame(res0 - 1)
    names(res) <- names(dudi$tab)
    row.names(res) <- row.names(dudi$tab)
    if (nf == 0) 
        return(res)
    for (i in 1:nf) {
        xli <- dudi$li[, i]
        yc1 <- dudi$c1[, i]
        res <- res + outer(xli, yc1) * res0
    }
    return(res)
}

data(chats)
chatsw <- data.frame(t(chats))
chatscoa <- dudi.coa(chatsw, scann = FALSE, nf = 20)
reconst_afc(chatscoa, 7)
reconst_afc2(chatscoa, 7)

##################################################"
## contrib biplot (paper by Greenacre)
## https://www.jstor.org/stable/43304818
## https://www.jstor.org/stable/23435686
##################################################"

## à faire avec foucart
## (remplacer chatscoa par analyse foucart (fou1))
## first
s.arrow(diag(sqrt(chatscoa$cw)) %*% as.matrix(chatscoa$c1), label = colnames(chatscoa$l1))
s.label(chatscoa$li, add.plot = TRUE)

## à faire avec foucart

## second
s.arrow(diag(sqrt(chatscoa$lw)) %*% as.matrix(chatscoa$l1), label = rownames(chatscoa$l1))
s.label(chatscoa$co, add.plot = TRUE)


##################################################"
## RV to compute the correlation between 2 networks
##################################################"

RV.foucart <- function(fou){
    acp.li <- dudi.pca(fou$li, row.w = fou$lw, scannf = FALSE)
    acp.co <- dudi.pca(fou$co, row.w = fou$cw, scannf = FALSE)
    Xk.li <- split(fou$Tli, fou$TL[,1])
    Xk.co <- split(fou$Tco, fou$TC[,1])
    res.co <- res.li <- rep(0, length(Xk.li))
    for(i in 1:length(Xk.li)){
        acpk.li <-  dudi.pca(Xk.li[[i]], row.w = fou$lw, scannf = FALSE)
        acpk.co <-  dudi.pca(Xk.co[[i]], row.w = fou$cw, scannf = FALSE)
       res.li[i] <- coinertia(acp.li, acpk.li, scannf = FALSE)$RV
       res.co[i] <- coinertia(acp.co, acpk.co, scannf = FALSE)$RV
    }
    return(list(li = res.li, co = res.co))
}

RV.foucart.tab <- function(list.df){
    ## compute RV between average table (produced by foucart analysis) and each individual table
    nblo <- length(list.df)
    res <- rep(0, nblo)
    tab.avg <- Reduce("+", list.df)
    afc1 <- dudi.coa(tab.avg, scan = FALSE)
    for(i in 1:nblo){
        afc2 <- dudi.coa(list.df[[i]], scan = FALSE)
        afc2$lw <- afc1$lw 
        coi <- ade4::coinertia(afc2, afc1, scan = FALSE)
        res[i] <- coi$RV
        
    }
    
    return(res)
}
## example of use
data(bf88)
fou1 <- foucart(bf88, scann = FALSE, nf = 3)
RV.foucart(fou1)
RV.foucart.tab(bf88)

aa = lapply(bf88, dudi.coa, scannf = F)
tab.avg <- Reduce("+", bf88)

for(i in 1:length(aa))
    aa[[i]]$lw <-  rowSums(tab.avg) / sum(tab.avg)

zz = statis(ktab.list.dudi(aa))
