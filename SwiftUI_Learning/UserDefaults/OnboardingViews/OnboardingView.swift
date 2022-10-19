//
//  OnboardingView.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 19.10.2022.
//

/*
 Onboarding steps:
 - Welcome screen
 - Add name
 - Add age
 - Add gender
 */


import SwiftUI

struct OnboardingView: View {
    
    // MARK: - Properties
    
    // onboarding inputs
    @State private var onboardingState: Int = 0
    @State private var name: String = ""
    @State private var age: Double = 18
    @State private var gender: String = ""
    
    // for the alerts
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool = false
    
    // for the app storage
    @AppStorage("name") var currentUsername: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false

    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))

    // MARK: - Body
    
    var body: some View {
        ZStack {
            // content
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.green)
                }
            }
           
            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)
            .alert(isPresented: $showAlert) {
                return Alert(title: Text(alertTitle))
            }
        }
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .background(Color.purple)
    }
}

// MARK: - Components

extension OnboardingView {
    
    // Bottom button
    private var bottomButton: some View {
        Text(onboardingState == 0 ? "Sign in" :
             onboardingState == 3 ? "Finish" : "Next")
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .animation(nil)
            .cornerRadius(10)
            .onTapGesture {
                handleNextButtonPressed()
            }
    }
    
    // MARK: -  Welcome section
    
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "map.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            
            Text("Find your best hiking route!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundColor(.white)
                    , alignment: .bottom
                )
            
            Text("This is the #1 App for finding your hiking routes online. I'm practicing to use AppStorage and other Swift UI features.")
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer()
            Spacer()
        }
        .padding(30)
        .multilineTextAlignment(.center)
    }
    
    // MARK: -  Add name section
        
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
             
            TextField("Your name here...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.blue)
                .cornerRadius(10)
                .multilineTextAlignment(.leading)
            
            Spacer()
            Spacer()
        }
        .padding(30)
        .multilineTextAlignment(.center)
    }
    
    // MARK: - Add age section
    
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
            
            Text("\(String(format: "%.0f", age))")
                .foregroundColor(.blue)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Slider(value: $age, in: 18...100, step: 1)
                .accentColor(.white)
            
            Spacer()
            Spacer()
        }
        .padding(30)
        .multilineTextAlignment(.center)
    }
    
    // MARK: - Add gender section
    
    private var addGenderSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
            
            Text(gender.count > 1 ? gender : "Select a gender")
                .frame(width: 350, height: 55)
                .foregroundColor(.purple)
                .font(.headline)
                .background(Color.white)
                .cornerRadius(10)
            
            Picker("Select a gender",
                   selection: $gender,
                   content: {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Non-Binary").tag("Non-Binary")
            })
            .pickerStyle(.wheel)
            
            Spacer()
            Spacer()
        }
        .padding(30)
        .multilineTextAlignment(.center)
    }
}

// MARK: - Functions

extension OnboardingView {
    
    // Go to next screens
    func handleNextButtonPressed() {
        // Check inputs
        switch onboardingState {
        case 1:
            guard name.count >= 3 else {
                showAlert(title: "Your name must be at least 3 characters long! 🥺")
                return
            }
        case 3:
            guard gender.count > 1 else {
                showAlert(title: "Please select a gender before moving forward 😌")
                return
            }
        default:
            break
        }
        
        if onboardingState == 3 {
            signIn()
        } else {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
    
    func signIn() {
        currentUsername = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }
    }
}
