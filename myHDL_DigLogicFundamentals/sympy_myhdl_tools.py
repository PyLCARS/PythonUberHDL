
# coding: utf-8

# In[1]:

from sympy import *
init_printing()
import pandas as pd
import numpy as np
from myhdl import *
from myhdlpeek import *
import random


# In[2]:

def TruthTabelGenrator(BoolSymFunc):
    """
    Function to generate a truth table from a sympy boolian expression
    BoolSymFunc: sympy boolian expression
    return TT: a Truth table stored in a pandas dataframe
    """
    colsL=sorted([i for i in list(BoolSymFunc.rhs.atoms())], key=lambda x:x.sort_key())
    colsR=sorted([i for i in list(BoolSymFunc.lhs.atoms())], key=lambda x:x.sort_key())
    bitwidth=len(colsL)
    cols=colsL+colsR; cols
    
    TT=pd.DataFrame(columns=cols, index=range(2**bitwidth))
    
    for i in range(2**bitwidth):
        inputs=[int(j) for j in list(np.binary_repr(i, bitwidth))]
        outputs=BoolSymFunc.rhs.subs({j:v for j, v in zip(colsL, inputs)})
        inputs.append(int(bool(outputs)))
        TT.iloc[i]=inputs
    
    return TT
    
    
    


# In[3]:

def TTMinMaxAppender(TruthTable):
    """
    Function that takes a Truth Table from "TruthTabelGenrator" function
    and appends a columns for the Minterm and Maxterm  exspersions for each
    
    TruthTable: Truth table from "TruthTabelGenrator"
    return TruthTable: truth table with appened min max term exspersions
    return SOPTerms: list of Sum of Poroduct terms
    return POSTerms: list of Product of Sum Terms
    """
    
    Mmaster=[]; mmaster=[]; SOPTerms=[]; POSTerms=[]
    for index, row in TruthTable.iterrows():
        
        if 'm' not in list(row.index):
            
            rowliterals=list(row[:-1].index)
            Mm=list(row[:-1])

            Mi=[]; mi=[]

            for i in range(len(rowliterals)):
                if Mm[i]==0:
                    Mi.append(rowliterals[i])
                    mi.append(~rowliterals[i])

                elif Mm[i]==0:
                    M.append(rowliterals[i])
                    m.append(~rowliterals[i])

            Mi=Or(*Mi, simplify=False); mi=And(*mi)
            Mmaster.append(Mi); mmaster.append(mi)
        
        
            if row[-1]==0:
                POSTerms.append(index)
            elif row[-1]==1:
                SOPTerms.append(index)
        else:
            
            if row[-3]==0:
                POSTerms.append(index)
            elif row[-3]==1:
                SOPTerms.append(index)
    
    if 'm' not in list(TruthTable.columns):
        TruthTable['m']=mmaster; TruthTable['M']=Mmaster
    return TruthTable, SOPTerms, POSTerms
            


# In[4]:

termsetBuilder=lambda literalsList: set(list(range(2**len(literalsList))))


# In[5]:

def POS_SOPformCalcater(literls, SOPlist, POSlist, DC=None):
    """
    Wraper function around sympy's SOPform and POSfrom boolian function
    genrator from the SOP, POS, DontCar (DC) list 
    
    """
    minterms=[]; maxterms=[]
    for i in SOPlist:
        minterms.append([int(j) for j in list(np.binary_repr(i, len(literls)))])
    for i in POSlist:
        maxterms.append([int(j) for j in list(np.binary_repr(i, len(literls)))])
    
    if DC!=None:
        dontcares=[]
        for i in DC:
            dontcares.append([int(j) for j in list(np.binary_repr(i, len(literls)))])
        DC=dontcares
    
    return simplify(SOPform(literls, minterms, DC)), simplify(POSform(literls, maxterms, DC))


# In[6]:

def Combo_TB(inputs=[]):
    """
    Basic myHDL test bench for simple compintorial logic testing
    """
    
    #the # of inputs contorls everything
    Ninputs=len(inputs)
    #genrate sequantil number of inputs for comparsion to known
    SequntialInputs=np.arange(2**Ninputs)
    
    #run the test for 2^Ninputs Seq and 2^Ninputs randomly =2*2^Ninputs cycles
    for t in range(2*2**Ninputs):
        #run sequantial
        try:
            #genrate binary bit repsersintion of current sequantl input
            NextSeqInput=np.binary_repr(SequntialInputs[t], width=Ninputs)
            
            #pass each bit into the inputs
            for i in range(Ninputs):
                inputs[i].next=bool(int(NextSeqInput[i]))
        
        #run the random to cheack for unexsected behavior
        except IndexError:
            NextRanInput=[random.randint(0,1) for i in range(Ninputs)]

            for i in range(Ninputs):
                inputs[i].next=NextRanInput[i]

        #virtural clock for combo only
        yield delay(1)
        now()
        
    


# In[7]:

bool(int('0'))


# In[8]:

def VerilogTextReader(loc, printresult=True):
    """
    Function that reads in a Verilog file and can print to screen the file
    contant
    """
    with open(f'{loc}.v', 'r') as vText:
        VerilogText=vText.read()
    if printresult:
        print(f'***Verilog modual from {loc}.v***\n\n', VerilogText)
    return VerilogText


# In[1]:

def VHDLTextReader(loc, printresult=True):
    """
    Function that reads in a vhdl file and can print to screen the file
    contant
    """
    with open(f'{loc}.vhd', 'r') as vhdText:
        VHDLText=vhdText.read()
    if printresult:
        print(f'***VHDL modual from {loc}.vhd***\n\n', VHDLText)
    return VHDLText


# In[9]:

def MakeDFfromPeeker(data):
    """
    Helper function to read the Peeker JSON information from a myHDL test bench
    simulationn and move the data into a pands dataframe for easer futer parsing
    and snyslsisis
    
    (note need to update functionality to read in numericl )
    """
    
    for i in range(len(data['signal'])):
        datainstance=data['signal'][i]['wave']
        while True:
            ith=datainstance.find('.')
            if ith==-1:
                break
            else: 
                datainstance=datainstance.replace('.', datainstance[ith-1], 1)


        data['signal'][i]['wave']=datainstance
        
    DataDF=pd.DataFrame(columns=[i['name'] for i in data['signal']])
    for i in data['signal']:
        DataDF[i['name']]=list(i['wave'])
    
    return DataDF


# In[ ]:




# In[10]:

def shannon_exspanson(f, term):
    """
    function to perform shannon's expansion theorm
    f is not a full equation
    """
    cof0=simplify(f.subs(term, 0)); cof1=simplify(f.subs(term, 1))
    return ((~term & cof0 | (term & cof1))), cof0, cof1


# ## Testing cell have been converted to Markdown so as to not clutter .py file

# x_1in, x_2in, x_3in, y_out=symbols('x_1in, x_2in, x_3in, y_out')
# AND3Def1=Eq(y_out, x_1in & x_2in & x_3in)
# AND3Def2=Eq(y_out, And(x_1in , x_2in, x_3in))
# AND3Def1, AND3Def2

# F=AND3Def1; F

# list(F.rhs.atoms())

# colsL=sorted([i for i in list(F.rhs.atoms())], key=lambda x:x.sort_key())
# colsR=sorted([i for i in list(F.lhs.atoms())], key=lambda x:x.sort_key())
# bitwidth=len(colsL)
# cols=colsL+colsR; cols

# TT=pd.DataFrame(columns=cols, index=range(2**bitwidth)); TT

# for i in range(2**bitwidth):
#     print([int(i) for i in list(np.binary_repr(i, bitwidth))])

# for i in range(2**bitwidth):
#     inputs=[int(j) for j in list(np.binary_repr(i, bitwidth))]
#     outputs=F.rhs.subs({j:v for j, v in zip(colsL, inputs)})
#     inputs.append(int(bool(outputs)))
#     TT.iloc[i]=inputs
# TT

# inputs=[0,0,0]
# outputs=F.rhs.subs({j:v for j, v in zip(colsL, inputs)})
# outputs

# TT=TruthTabelGenrator(AND3Def1)
# TT

# T0=TT.iloc[0]; T0

# POS=[]
# T0[-1]
# if T0[-1]==0:
#     POS.append(0)
# POS

# T0literal=list(T0[:-1].index); T0literal

# Mm0=list(T0[:-1]); Mm0

# M=[]; m=[]
# for i in range(len(T0literal)):
#     if Mm0[i]==0:
#         M.append(T0literal[i])
#         m.append(~T0literal[i])
#     elif Mm0[i]==0:
#         M.append(T0literal[i])
#         m.append(~T0literal[i])
# M=Or(*M); m=And(*m)

# TT=TruthTabelGenrator(AND3Def1)
# TT
# Taple, SOP, POS=TTMinMaxAppender(TT)
# SOP, POS
# 

# TT

# F, w, x, y, z=symbols('F, w, x, y, z')
# Feq=Eq(F,(y&z)|(z&~w)); Feq

# FTT=TruthTabelGenrator(Feq)
# FTT

# _, SOP, POS=TTMinMaxAppender(FTT)
# SOP, POS

# FTT

# for i in SOP:
#     print([int(j) for j in list(np.binary_repr(i, 4))])

# POS_SOPformCalcater([w, y, z], SOP, POS)

# SOP

# 
