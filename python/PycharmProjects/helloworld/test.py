def BMI_CAL(name, height_m, weight_kg):
    BMI = 703 * weight_kg / (height_m ** 2)
    print("BMI =", BMI)
    # print(BMI)
    if BMI < 25:
        return name + " is not over weight"
    elif BMI > 25 and BMI < 30:
        return name + " is over weight"
    else:
        return name + " obese"
BMI_CAL("anji", 64, 175)