import networkx as nx
import os
from AFN import Afn
class PlotAutomaton:
    def __init__(self, automaton):
        self.automaton = automaton
    
    def plotAutomaton(self, regex):
        G = nx.MultiDiGraph()
        for x in self.automaton.Fsm.Q:
            if x.getIsFinalState():
                G.add_node(x.getName(), peripheries=2)
            else:
                G.add_node(x.getName())
        for key, value in self.automaton.Transition.dict.items():
            #isinstance(self.automaton, Afn)
            for x in value:
                G.add_edge(key[0].getName(), x.getName(), label=key[1])
        nx.nx_agraph.write_dot(G, "dot1.gv")
        os.system("dot dot1.gv -Tpng > dot1.png")
        f = open("dot1.gv")
        lines = f.readlines()
        lines.insert(1, '\tlabelloc="t";\n')
        lines.insert(2, f'\tlabel="{regex.expression}";\n')
        lines.insert(3, '\trankdir=LR;\n')
        lines.insert(4, '\t" " [shape=plaintext];\n')
        lines.insert(5, f'\t" " -> {self.automaton.Fsm.q0.getName()};\n')
        f = open("dot1.gv", "w")
        for x in lines:
            f.write(x)
        f.close()
        os.system("dot dot1.gv -Tpng > dot1.png")
        os.system("xdg-open dot1.png")
        Afn.printAutomata(self.automaton)
