package services;

import unit.CalculatorException;

public class CalculatorServices {
    public static float calculate(float numberOne, float numberTwo, char operator ) throws CalculatorException {
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
                    throw new CalculatorException("Không thể chia cho 0");
            default:
                throw new RuntimeException("Không hợp lệ");
        }
    }
}
