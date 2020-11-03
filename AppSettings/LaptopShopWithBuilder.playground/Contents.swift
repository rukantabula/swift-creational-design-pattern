import UIKit

func createBuilder(configuration: [String: String]) -> LaptopBuilder? {
    guard let model = configuration["base_model"] else {
        return nil
    }
    
    var result: LaptopBuilder?
    
    switch model {
    case "budget":
        result = BudgetLaptopBuilder()
    case "office":
        result = OfficeLaptopBuilder()
    case "high-end":
        result = HighEndLaptopBuilder()
    default:
        print("Unexpected Value")
    }
    
    return result
}

var configuration = ["base_model": "budget"]
var laptopBuilder = createBuilder(configuration: configuration)
var director = Director(builder: laptopBuilder)

director.constructLaptop(configuration: configuration)

if let laptop = laptopBuilder?.getLaptop(){
    print(laptop)
}


