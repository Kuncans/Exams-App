//
//  ExamQuestionsView.swift
//  Exams-App
//
//  Created by Duncan Kent on 03/03/2022.
//

import SwiftUI

struct ExamQuestionsView: View {
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    @EnvironmentObject private var vm: HomeViewModel
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                ZStack {
                    Color.theme.backgroundCard
                        .frame(maxWidth: .infinity)
                        .frame(height: 178)
                        .ignoresSafeArea(edges: .top)
                        

                    customNavigationBar
                        .ignoresSafeArea(edges: .top)

                }
                
                VStack {
                    
                    Text("Add Instructions")
                        .font(.interRegular14)
                        .foregroundColor(.theme.textSecondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("", text: $vm.newExamModule)
                        .padding(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))
                        .font(.interRegular14)
                        .foregroundColor(.black)
                    
                }
                .padding(.horizontal)
                .padding(.bottom, 16)
                
                VStack {
                    
                    Text("Section Name")
                        .font(.interRegular14)
                        .foregroundColor(.theme.textSecondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Section title", text: $vm.newExamModule)
                        .padding(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))
                        .font(.interRegular14)
                        .foregroundColor(.black)
                    
                    TextField("Section description (optional)", text: $vm.newExamModule)
                        .padding(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .padding(.bottom, 36)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))
                        .font(.interRegular14)
                        .foregroundColor(.black)

                }
                .padding(.horizontal)
                .padding(.bottom, 32)
                
                VStack {
                    
                    Text("What is the size of the Earth?")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    Divider()
                        .padding(.bottom, 16)
                        .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "record.circle")
                            .renderingMode(.template)
                            .foregroundColor(.theme.accentPrimary)
                        
                        Spacer()
                        
                        HStack {
                            
                            Spacer()
                            
                            HStack {
                                Text("A")
                                    .foregroundColor(.white)
                                    .frame(width: 30, height: 30)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.accentPrimary))
                                
                                Text("Option one")
                                    .frame(width: 200, height: 30, alignment: .leading)

                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.questionBackground))
                            
                            Spacer()
                            
                            Image(systemName: "x.circle.fill")
                                .renderingMode(.template)
                                .foregroundColor(.theme.accentSecondary)
                            
                            
                        }
                        
                        
                    }.padding(.horizontal)
                    
                }
                .padding(.bottom)
                
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))
                .padding(.horizontal, 16)
                
                Spacer()
                
            }
            .navigationBarHidden(true)
        }
    }
}

struct ExamQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        ExamQuestionsView()
            .environmentObject(HomeViewModel())
    }
}

extension ExamQuestionsView {
    
    private var customNavigationBar: some View {
        
        HStack {
            
            Image(systemName: "arrow.left")
                .renderingMode(.template)
                .foregroundColor(.theme.accentSecondary)
                .onTapGesture {
                    dismiss()
                    vm.selectedTab = 3
                }

            Text("Create New Exam")
                .font(.interSemibold16)
                .foregroundColor(Color.theme.textSecondary)
            
            Spacer()
            
            Button(action: {}) {
                Text("Next")
                    .font(.interMedium16)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.theme.accentSecondary, lineWidth: 1)
            )

        }
        .padding(.horizontal, 26)
        
    }
}
