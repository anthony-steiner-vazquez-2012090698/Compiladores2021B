from Transition import Transition
from Thompson import Thompson
print("Ingresa una expresión regular:")
regex = input()
t = Thompson(regex)
t.ThompsonContruction()
t.printAutomaton()