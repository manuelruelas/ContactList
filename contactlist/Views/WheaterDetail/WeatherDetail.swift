//
//  WeatherDetail.swift
//  contactlist
//
//  Created by Mac mini on 14/01/22.
//

import SwiftUI

struct WeatherDetail: View {
    @ObservedObject var viewModel = WeatherDetailVM()
    var body: some View {
        VStack{
            if(viewModel.weatherInfo != nil){
                HStack{
                    VStack{
                        Text("\(viewModel.weatherInfo!.temp2M.max)ºC").font(.title)
                        Text("MAX")
                    }
                    Text("-").font(.title)
                    VStack{
                        Text("\(viewModel.weatherInfo!.temp2M.min)ºC").font(.title)
                        Text("MIN")
                    }
                }
                
                Text("Today").font(.headline)
                
                
                List{
                    ForEach(viewModel.weekWeather){ value in
                        HStack{
                            Text("\(value.date.toDate())")
                            Spacer()
                            Text("\(value.temp2M.max)ºC - \(value.temp2M.min)ºC ")
                        }
                        
                    }
                }
                
            }else{
                ProgressView()
            }
        }.navigationTitle("Weather")
        
        
    }
}

struct WeatherDetail_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetail()
    }
}
