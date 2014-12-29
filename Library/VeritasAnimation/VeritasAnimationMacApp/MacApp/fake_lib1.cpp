//
//  fake_lib1.cpp
//  GUI_Showcase
//
//  Created by Nathan Daly on 1/22/13.
//  Copyright (c) 2013 Lions Entertainment. All rights reserved.
//

#include "fake_lib1.h"

#include <iostream>
#include <ctime>
#include <cmath>
#include <algorithm>

using std::string;
using std::cout; using std::endl;
using std::find;

/* Helpers */
static int str_to_month(std::string mon);

/***** IMPLEMENTATION *****/

string date_of_birth(double age) {
    
    if (age == 0) {
        throw FakeLib1Error("Age cannot == 0!");
    }
    if (age < 0) {
        throw FakeLib1Error("Cannot have a negative age!");
    }
    
    time_t curr = time(0);
    std::tm local = *localtime ( &curr );
    
    int years = (int)age;
    int months = (age - years) * 12;
    int days = (age - years - ((double)months)/12) * 365;
                    
    local.tm_year -= years;
    local.tm_mon -= months;
    local.tm_mday -= days;
    
    /* call mktime: timeinfo->tm_wday will be set */
    mktime (&local); 
    
    char buffer[80];
    
    size_t success = strftime (buffer, 80, "%b %d %Y", &local);
    
    if (!success) {
        throw FakeLib1Error("Failed to create date string! \n"\
                            "   (Possible reason: age may be too large..)");
    }

    return buffer;    
}

double age_from_dob(const std::string& date) {
    
    if (date == "") { 
        throw FakeLib1Error("Empty date string!");
    }
    
    int day, year;
    char month[30];
    
    int num_read = sscanf(date.c_str(), "%s %u %u", &month, &day, &year);
        
    if (num_read != 3) {
        string error = "Couldn't parse date string! Failed on: ";
        switch (num_read) {
            case 0: 
                error += "Month"; break;
            case 1: 
                error += "Day of the Month"; break;
            case 2: 
                error += "Year"; break;
        }
        throw FakeLib1Error(error);
    }
    
    // Check for errors
    if (strlen(month) != 3) {
        throw FakeLib1Error("Month name must be three chars!");
    }
    if (!isupper(month[0])) {
        throw FakeLib1Error("Month name must start with capital letter!");
    }
    if (day > 31 || day <= 0) {
        throw FakeLib1Error("Day out of range! (Must be 1 <= day <= 31)");
    }
    if (!(year >= 1900 && year <= 3000)) {
        throw FakeLib1Error("Year out of range! (Must be 1900 <= year <= present)");
    }

    
    // create birthday tm struct
    time_t curr = time(0);
    std::tm birthday = *localtime ( &curr );
    
    // set birthday values
    birthday.tm_year = year - 1900; // tm_year is represented as years since 1990
    birthday.tm_mon = str_to_month(month);
    birthday.tm_mday = day;

    // convert to a time_t and take difference from curr
    double age_secs = difftime(curr, mktime(&birthday));
    
    double age_years = age_secs / 31557600; // (num secs in a year)
    
    return age_years;
}

static int str_to_month(std::string mon) {
    
    static const char *months[] = {"Jan","Feb","Mar","Apr","May","Jun",
                                   "Jul","Aug","Sep","Oct","Nov","Dec"};
    
    // count which entry it is.
    int month = find(months, months + 12, mon) - months;
    
    if (month == 12) { 
        throw FakeLib1Error("Invalid month!");
    }
    
    return month;
}

