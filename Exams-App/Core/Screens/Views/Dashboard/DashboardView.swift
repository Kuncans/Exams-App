//
//  DashboardView.swift
//  Exams-App
//
//  Created by Duncan Kent on 01/03/2022.
//

import SwiftUI

struct DashboardView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    @State private var dropdownExpanded = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Color.theme.backgroundCard.edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack {
                        
                        header
                        
                        examinations
                        
                        VStack {
                            
                            Text("Attendance")
                                .font(.interMedium18)
                                .foregroundColor(.theme.textSecondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            classroomsList
                            
                            HStack {
                                
                                Spacer()
                                
                                AttendanceProgressView(attendance: Float(vm.selectedClass.classAttendance))
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                Spacer(minLength: 30)
                                
                                attendanceStats
                                
                                Spacer()
                                
                            }
                            
                            HStack {
                                Image(systemName: "bell.fill")
                                
                                Text("Your attendance seems to be low in \(vm.selectedClass.classNameAbbreivation)")
                                    .font(.robotoRegular)
                            }
                            .padding(.horizontal, 18)
                            .padding(.vertical, 10)
                            .foregroundColor(.theme.accentBlue)
                            .background(Color.theme.accentBlueSecondary.opacity(0.2))
                            .cornerRadius(5)
                            .padding(.bottom, 12)
                            .opacity(vm.selectedClass.classAttendance < 75.0 ? 1.0 : 0.0)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 18)
                        .background(.white)
                        
                        Spacer()
                    }
                    
                }
                .navigationTitle("")
                .navigationBarHidden(true)
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .environmentObject(HomeViewModel())
    }
}

extension DashboardView {
    
    private var header: some View {
        
        HStack {
            
            VStack (alignment: .leading) {
                Text("Hello \(vm.user.name)")
                    .font(.interMedium28)
                    .foregroundColor(.theme.accentPrimary)
                Text("Welcome to your **Dashboard**")
                    .font(.interMedium14)
                    .foregroundColor(.theme.accentSecondary)
            }
            
            Spacer()
            
            Image(vm.user.image)
                .resizable()
                .clipShape(Circle())
                .frame(width: 40, height: 40)
            
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 36)
        
    }
    
    private var examinations: some View {
        
        VStack {
            HStack {
                Text("Examinations")
                    .font(.interMedium18)
                    .foregroundColor(.theme.textSecondary)
                Spacer()
                NavigationLink {
                    NewExamView()
                } label: {
                    Image(systemName: "plus")
                        .tint(Color.theme.accentSecondary)
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 28) {
                    ForEach(vm.exams, id: \.self) { exam in
                        ExamCardView(exam: exam)
                    }
                }
            }
            .frame(height: 180)
            
        }
        .padding([.horizontal, .top], 20)
        .padding(.bottom, 12)
        .background(.white)
        .frame(maxWidth: .infinity)
    }
    
    private var classroomsList: some View {
        
        DisclosureGroup(vm.selectedClass.name, isExpanded: $dropdownExpanded) {
            ForEach(vm.classrooms, id: \.self) { classroom in
                if vm.selectedClass.name != classroom.name {
                    VStack {
                        Divider()
                        
                        Text(classroom.name)
                            .foregroundColor(.theme.accentPrimary)
                            .padding(.vertical, 2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .onTapGesture {
                                vm.selectedClass = classroom
                                withAnimation {
                                    dropdownExpanded = false
                                }
                                
                                
                                
                            }
                    }
                }
            }
        }
        .padding([.vertical, .trailing])
        .padding(.bottom, 4)
        
    }
    
    
    private var attendanceStats: some View {
        
        VStack (spacing: 16) {
            
            HStack {
                Text("Total Classes")
                    .font(.interMedium12)
                    .foregroundColor(.theme.textTertiary)
                
                Spacer()
                
                Text("\(vm.selectedClass.classesTotal)")
                    .font(.interMedium12)
                    .foregroundColor(.black)
            }
            .padding(.trailing, 8)
            
            HStack {
                Text("Classes Attended")
                    .font(.interMedium12)
                    .foregroundColor(.theme.textTertiary)
                
                Spacer()
                
                Text("\(vm.selectedClass.classesAttended)")
                    .font(.interMedium12)
                    .foregroundColor(.black)
            }
            .padding(.trailing, 8)
            
            HStack {
                Text("Classes Missed")
                    .font(.interMedium12)
                    .foregroundColor(.theme.textTertiary)
                
                Spacer()
                
                Text("\(vm.selectedClass.classesMissed)")
                    .font(.interMedium12)
                    .foregroundColor(.black)
            }
            .padding(.trailing, 8)
            
            HStack {
                Text("Classes Left")
                    .font(.interMedium12)
                    .foregroundColor(.theme.textTertiary)
                
                Spacer()
                
                Text("\(vm.selectedClass.classesLeft)")
                    .font(.interMedium12)
                    .foregroundColor(.black)
            }
            .padding(.trailing, 8)
            
            
        }
        
    }
    
}
