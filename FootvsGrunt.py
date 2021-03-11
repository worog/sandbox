# -*- coding: utf-8 -*-
"""
Created on Sun Oct 23 22:11:03 2016
Footmen vs Grunt
@author: Wojciech Rogala
"""

import scipy as sci
import matplotlib.pyplot as plt
import numpy as np



def GruntsAtt(Footred,Grunt,AttG):
    AnG=(1-Footred)*Grunt*AttG
    return AnG    
    
def GruntsHP(Grunt,HpGrunt):
    HpnG=[Grunt*HpGrunt]
    return HpnG

def FootsAtt(Gruntred,Foot,AttF):
   AnF=(1-Gruntredred)*Grunt*AttF
   return AnF

def FootsHP(Foot,HpFoot):
    HpnF=[Foot*HpFoot]
    return HpnF

if __name__ == "__main__":
    Foot=3
    AttF=12.5
    dtF=1.35
    defF=2  
    Footred=defF*(0.06)/(1+0.06*defF)
    HpFoot=420


    Grunt=2
    AttG=19.5
    dtG=1.6
    defG=1
    Gruntred=defG*(0.06)/(1+0.06*defG)
    HpGrunt=700


    time= np.linspace(0,200,4000)
    AF=[FootsAtt(Gruntred,Foot,AttF)]
    HpF=[FootsHP(Foot,HpFoot)]
    AG=[GruntsAtt(Footred,Grunt,AttG)]
    HpG=[GruntsHP(Grunt,HpGrunt)]

    nF=[]
    nG=[]

    for i in time:
    #  while Grunt!=0 || Foot!   
        nF.append(i%dtF)
        nG.append(i%dtG)
        if i%dtF == 0:
            loss=HpG[i-1]-AF[i-1]
            HpG.append(loss)           
            if HpG[i]%HpGrunt==0:
                Grunt=-1
            AG.append(GruntsAtt(Footred,Grunt,AttG))
        elif i%dtG==0:
            loss=HpF[i-1]-AG[i-1]
            HpG.append(loss)           
            if HpF[i]%HpFoot==0:
                Foot=-1 
            Ag.append(GruntsAtt(Footred,Grunt,AttG))        
        else:
            HpG.append(HpG[i-1])
            HpF.append(HpF[i-1])
            AG.append(AG[i-1])           
            AF.append(AF[i-1])
            
        plt.plot(AF.time,'r.')
        plt.show()
