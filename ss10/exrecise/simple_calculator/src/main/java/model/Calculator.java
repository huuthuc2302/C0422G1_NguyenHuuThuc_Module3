package model;

public class Calculator {
    public static float calculate(float numberOne, float numberTwo, char operator ){
        switch (operator){
            case '+':
                return numberOne + numberTwo;
            case '-':
                return numberOne - numberTwo;
            case '*':
                return numberOne * numberTwo;
            case '/':
                if(numberTwo != 0)
                    return numberOne / numberTwo;
                else
                    throw new RuntimeException("Không thể chia cho 0");
            default:
                throw new RuntimeException("Không hợp lệ");
        }
    }
}
