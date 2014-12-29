//
//  fake_lib1.h
//  GUI_Showcase
//
//  Created by Nathan Daly on 1/22/13.
//  Copyright (c) 2013 Lions Entertainment. All rights reserved.
//

#ifndef GUI_Showcase_fake_lib1_h
#define GUI_Showcase_fake_lib1_h

#include <string>

/*** Error class ***/
struct FakeLib1Error {
    std::string error_msg;
    FakeLib1Error(const std::string &msg_) : error_msg(msg_) { }
};


/*** Library functions ***/

// Take age as a double and return the date of birth as a string.
// Resultant format: 
//    Mmm dd yyyy 
// May throw FakeLib1Error
std::string date_of_birth(double age);

// Take a date of birth as a string and return age.
// Expected format:
//    Mmm dd yyyy 
// May throw FakeLib1Error
double age_from_dob(const std::string& date);





#endif
