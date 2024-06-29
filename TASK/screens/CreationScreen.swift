//
//  CreationScreen.swift
//  TASK
//
//  Created by macbook pro on 29/06/24.
//

import SwiftUI
import PhotosUI


struct CreationScreen: View {
    
    @EnvironmentObject var vm: MainViewModel
    @Environment(\.presentationMode) var presentationMode

    @State var title:String = ""
    @State var descreption:String = ""
    @State private var date = Date.now
    @State private var avatarItem: PhotosPickerItem?
    @State var image: UIImage?

    @State private var showingAlertError = false
    @State private var showingAlertSuccess = false

    
    var body: some View {
        NavigationView(content: {
            
            VStack(alignment:.leading ,spacing: 16, content: {
            
            Text("Title")
                    .labelTextStyle()
                
            TextField("Type something here...", text: $title)
            //. textFieldStyle(RoundedBorderTextFieldStyle())
                .padding ( )
                .background (Color.gray.opacity(0.3).cornerRadius (10))
                .foregroundColor(.red)
                .font(.headline)
                
                Text("Discreption")
                    .labelTextStyle()
    
                TextField("....", text: $descreption, axis: .vertical)
                 .lineLimit(20)
                 .font(.title)
                 .textFieldStyle(.roundedBorder)
                
                DatePicker(selection: $date, in: ...Date.now, displayedComponents: .date) {
                               Text("Due date")
                            .labelTextStyle()
                           }
                
                PhotosPicker("Select Task image", selection: $avatarItem, matching: .images)
                
                
                
                if let image {
                 Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200,height: 200)
                }
                
                    
//                TextEditor(pleacepolder: "Type something here...", text: $textFieldText)
//                //. textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding ( )
//                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
//                    .lineLimit(20)
//            
//                    .background (Color.gray.opacity(0.3).cornerRadius (10))
//                    .foregroundColor(.red)
//                    .font(.headline)
                Spacer()
                Button(action: {
                    if(validation()){
                        showingAlertError.toggle()
                    }else{
                        vm.addTask(task: TaskData.init(
                            id: UUID().uuidString,
                            title: title,
                            descreption: descreption,
                            date: date,
                            image: image)
                        )
                        showingAlertSuccess.toggle()
                    }
                   
                }, label: {
                    Text("Save".uppercased())
                        .padding()
                        .frame (maxWidth: .infinity)
                        .background (Color.blue.cornerRadius (10))
                        .foregroundColor(.white)
                        .font(.headline)
                } )
                Spacer()
        })
        .onChange(of: avatarItem) {
                Task {
                            if let loaded = try? await avatarItem?.loadTransferable(type: Data.self) {
                                image = UIImage(data:loaded)
                            } else {
                                print("Failed")
                            }
                        }
                    }
        .frame(height: .infinity,alignment: .topLeading)
        .padding()
        .alert("Error message", isPresented: $showingAlertError, actions: {
            Button("OK", role: .cancel) { }

        }, message: {
            Text("Title is empty.")
                .descriptionTextStyle()
        })
        .alert("Success message", isPresented: $showingAlertSuccess) {
                   Button("OK", role: .cancel) { 
                       presentationMode.wrappedValue.dismiss()
                   }
               }
        .navigationTitle("Creation Screen")

        })
    }
    
    func validation()-> Bool{
        return title.isEmpty
    }


}

#Preview {
    CreationScreen()
}
