one = int(input("Digite o primeiro número: "))
two = int(input("Digite o segundo número: "))
three = int(input("Digite o terceiro número: "))
four = int(input("Digite o quarto número: "))
five = int(input("Digite o quinto número: "))

list = [one, two, three, four, five]

sum = 0

for i in range(len(list)):
    if list[i] >= 0:
        sum += list[i]

print("A soma dos números positivos é: ", sum)
