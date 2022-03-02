//
//  NewExamView.swift
//  Exams-App
//
//  Created by Duncan Kent on 02/03/2022.
//

import SwiftUI

struct NewExamView: View {
    
    init() {
        UIDatePicker.appearance().backgroundColor = UIColor.clear
    }
    
    @EnvironmentObject private var vm: HomeViewModel
    @Environment (\.dismiss) var dismiss
    @State private var dropdownExpanded = false
    
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
                                                            
                    classroom
                    
                    VStack {
                        
                        syllabus
                    
                        dateExam
                        
                        timeExam
                        
                        duration
                        
                        timeframe
                        
                        totalMarks
                        
                        categoryExam
                        
                    }
                    .offset(y: dropdownExpanded ? 40 : 0)

                    Spacer()
                    
                }

                .navigationBarHidden(true)
            }
            .onTapGesture {
                hideKeyboard()
            }

        }
}

struct NewExamView_Previews: PreviewProvider {
    static var previews: some View {
        NewExamView()
            .environmentObject(HomeViewModel())
    }
}

extension NewExamView {
    
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
    
    private var classroom: some View {
        
        HStack {
            Text("Classroom:")
                .font(.interRegular16)
                .frame(width: 100, alignment: .leading)
                .padding(.leading)
            Spacer()
            ZStack {
                
                
                DisclosureGroup(vm.newExamClassroom?.name ?? "Select Classroom", isExpanded: $dropdownExpanded) {
                    ScrollView (showsIndicators: false) {
                        ForEach(vm.classrooms, id: \.self) { classroom in
                            if vm.newExamClassroom?.name != classroom.name {
                                Spacer(minLength: 5.0)
                                VStack {
                                    Text(classroom.name)
                                        .font(.interRegular12)
                                        .foregroundColor(.theme.accentSecondary)
                                        .padding(.vertical, 4)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .onTapGesture {
                                            vm.newExamClassroom = classroom
                                            withAnimation {
                                                dropdownExpanded = false
                                            }
                                        }
                                        .lineLimit(1)
                                }
                            }
                        }
                    }
                    .frame(maxHeight: 100)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))
                .lineLimit(1)
                .foregroundColor((vm.newExamClassroom != nil) ? Color.theme.accentSecondary : Color.theme.textSecondary)
                .font(.interRegular14)
            }
            .frame(width: 230, height: 45, alignment: .leading)
            
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
        
    }
    
    private var syllabus: some View {
        
        HStack {
            Text("Syllabus:")
                .font(.interRegular16)
                .frame(width: 100, alignment: .leading)
                .padding(.leading)
            Spacer()
            
            TextField("", text: $vm.newExamModule)
                .placeholder(Text("Enter modules here")
                                .foregroundColor(.theme.accentSecondary), show: vm.newExamModule.isEmpty)
                .padding(.leading)

                .frame(width: 230, height: 45, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))
                .font(.interRegular14)
                .foregroundColor(.theme.accentSecondary)
                .padding(.leading, 10)
                .accentColor(.theme.accentSecondary)
                .tint(Color.theme.accentSecondary)
        }
        .padding(.horizontal)
        .padding(.bottom, 8)

    }
    
    private var dateExam: some View {
        
        HStack {
            
            Text("Date")
                .font(.interRegular16)
                .frame(width: 140, alignment: .leading)
                .padding(.leading)
            Spacer()
            
           
            HStack(spacing: 3) {
                
                TextField("", text: $vm.newExamDateDay)
                    .placeholder(Text("   DD")
                                    .foregroundColor(.theme.accentSecondary), show: vm.newExamDateDay.isEmpty)
                Text("/")
                TextField("", text: $vm.newExamDateMonth)
                    .placeholder(Text("   MM")
                                    .foregroundColor(.theme.accentSecondary), show: vm.newExamDateMonth.isEmpty)
                Text("/")
                TextField("", text: $vm.newExamDateYear)
                    .placeholder(Text("   YY")
                                    .foregroundColor(.theme.accentSecondary), show: vm.newExamDateYear.isEmpty)
                
                Image(systemName: "calendar")
                    .renderingMode(.template)
                    .padding(.trailing)
            }
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .foregroundColor(.theme.accentSecondary)
            .frame(height: 45)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))

        }
        .padding(.horizontal)
        .padding(.bottom, 8)

    }
    
    private var timeExam: some View {
        
        HStack {
            
            Text("Time")
                .font(.interRegular16)
                .frame(width: 140, alignment: .leading)
                .padding(.leading)
            Spacer()
            
           
            HStack(spacing: 3) {
                
                TextField("", text: $vm.newExamTimeHour)
                    .placeholder(Text("   HR")
                                    .foregroundColor(.theme.accentSecondary), show: vm.newExamTimeHour.isEmpty)
                Text(":")
                TextField("", text: $vm.newExamTimeMins)
                    .placeholder(Text("   MN")
                                    .foregroundColor(.theme.accentSecondary), show: vm.newExamTimeMins.isEmpty)
                Text(":")
                TextField("", text: $vm.newExamTimeSecs)
                    .placeholder(Text("   SC")
                                    .foregroundColor(.theme.accentSecondary), show: vm.newExamTimeSecs.isEmpty)
                Image(systemName: "clock")
                    .renderingMode(.template)
                    .padding(.trailing)
            }
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .foregroundColor(.theme.accentSecondary)
            .frame(height: 45)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))

        }
        .padding(.horizontal)
        .padding(.bottom, 8)

    }
    
    private var duration: some View {
        
        HStack {
            
            Text("Duration")
                .font(.interRegular16)
                .frame(width: 220, alignment: .leading)
                .padding(.leading)
            Spacer()
            
           
            HStack(spacing: 3) {
                
                TextField("", text: $vm.newExamDurationHour)
                    .placeholder(Text("     HR")
                                    .foregroundColor(.theme.accentSecondary), show: vm.newExamDurationHour.isEmpty)
                Text("|")
                    .font(.interRegular24)
                TextField("", text: $vm.newExamDurationMins)
                    .placeholder(Text("   MN")
                                    .foregroundColor(.theme.accentSecondary), show: vm.newExamDurationMins.isEmpty)
            }
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .foregroundColor(.theme.accentSecondary)
            .frame(height: 45)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))

        }
        .padding(.horizontal)
        .padding(.bottom, 8)

    }
    
    private var timeframe: some View {
        
        HStack {
            
            Text("Timeframe")
                .font(.interRegular16)
                .frame(width: 220, alignment: .leading)
                .padding(.leading)
            Spacer()
            
           
            HStack(spacing: 3) {
                
                TextField("", text: $vm.newExamDurationTimeframeHour)
                    .placeholder(Text("     HR")
                                    .foregroundColor(.theme.accentSecondary), show: vm.newExamDurationTimeframeHour.isEmpty)
                Text("|")
                    .font(.interRegular24)
                TextField("", text: $vm.newExamDurationTimeframeMins)
                    .placeholder(Text("   MN")
                                    .foregroundColor(.theme.accentSecondary), show: vm.newExamDurationTimeframeMins.isEmpty)
            }
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .foregroundColor(.theme.accentSecondary)
            .frame(height: 45)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))

        }
        .padding(.horizontal)
        .padding(.bottom, 8)

        
    }
    
    private var totalMarks: some View {
        
        HStack {
            
            Text("Total Marks")
                .font(.interRegular16)
                .frame(width: 220, alignment: .leading)
                .padding(.leading)
            
            Spacer()
            
            TextField("", value: $vm.newExamTotalMarks, format: .number)
                .multilineTextAlignment(.center)
                .foregroundColor(.theme.accentSecondary)
                .frame(height: 45)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))
                .keyboardType(.numberPad)
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
        
    }
    
    private var categoryExam: some View {
        
        HStack {
            
            Text("Category")
                .font(.interRegular16)
                .frame(width: 140, alignment: .leading)
                .padding(.leading)
            Spacer()
            
           
            HStack(spacing: 3) {
                
                TextField("", text: $vm.newExamCategory)
                    .placeholder(Text("Internal, mock, etc")
                                    .foregroundColor(.theme.accentSecondary), show: vm.newExamCategory.isEmpty)
            }
            .padding(.horizontal)
            .font(.interRegular14)
            .multilineTextAlignment(.leading)
            .foregroundColor(.theme.accentSecondary)
            .frame(height: 45)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))

        }
        .padding(.horizontal)
        .padding(.bottom, 8)
        
    }
    
}
