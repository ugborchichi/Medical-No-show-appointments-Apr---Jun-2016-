# Medical No Show Appointments-Apr-Jun 2016

## Project Overview

Missed medical appointments are a major operational challenge in healthcare systems worldwide. When patients fail to attend scheduled visits, it leads to wasted clinical time, increased healthcare costs, delayed treatment, and reduced access for other patients.

This project analyzes over 100,000 medical appointment records to identify the key factors driving patient no-shows. Using SQL-based analysis, the study evaluates demographic, socioeconomic, medical, and scheduling-related variables to uncover patterns that influence attendance behavior.

The goal is to translate data insights into actionable strategies that improve appointment utilization and healthcare delivery efficiency.

## Problem Statement

The healthcare facility experiences a significant number of missed appointments, leading to underutilized clinical capacity, revenue loss, increased waiting times, disrupted care continuity and operational inefficiencies.

Despite reminder systems and scheduling processes, approximately 20.2% of appointments are missed, meaning 1 in 5 appointment slots go unused.

There is a need to understand:

-  Which patient groups are most likely to miss appointments

-  Whether scheduling structure influences attendance

-  How socioeconomic and medical factors impact behavior

-  What operational adjustments can reduce no-show rates

## Project Structure

### Dataset Description

The dataset contains cleaned medical appointment no-show records contains theses columns; patient Id, appointment id, Gender,	Scheduled Day,	Appointment Day,	Age,	Neighbourhood,	Scholarship,	Hypertension,	Diabetes,	Alcoholism,	Handcap,	SMS_received,	Showed_up and	Date difference.

### Analytical Questions

1.  What is the overall no-show rate?

2.  How does the no-show rate vary by day of the week?

3.  How does no-show rate vary by age group?

4.  Is there a difference in attendance between male and female patients?

5.  Do patients with government welfare support (e.g., Scholarship) miss more appointments?

6.  How does waiting time (days between scheduling and appointment) affect no-show rates?

7.  Is there a threshold after which longer waiting times significantly increase no-shows?

8.  Do same-day or next-day appointments have better attendance?

9.  Do patients who receive SMS reminders show up more often?

10.  What is the percentage difference in attendance with vs without SMS?

11.  Does SMS effectiveness vary by age or gender?

12.  Are patients with chronic conditions (hypertension, diabetes, alcoholism) more or less likely to miss appointments?

13.  How does no-show rate vary across neighborhoods?

14.  Are repeat patients less likely to miss appointments?

15.  Do patients with prior no-shows continue to miss future appointments?

16.  What percentage of patients are habitual no-shows?

## Key Findings

1.  **Overall Attendance Performance**

The overall no-show rate stands at 20.2%, meaning approximately 1 in every 5 appointments is missed.
This represents a significant operational inefficiency and potential revenue loss for the healthcare facility.

2.  **Gender Does Not Significantly Influence Attendance**

    -  Male no-show rate: 20.08% (36,869 missed appointments)

    -  Female no-show rate: 20.36% (70,118 missed appointments)

Although females account for a higher absolute number of missed appointments, the no-show rates are nearly identical, indicating that gender is not a major determinant of appointment adherence.

3.  **Younger Patients Are More Likely to Miss Appointments**

Attendance improves with age. Seniors are the most compliant group, while young adults demonstrate the highest likelihood of missing appointments. This suggests behavioral and lifestyle factors (e.g., work commitments, lower perceived urgency) may influence attendance among younger populations.

4.  **Socioeconomic Support Is Associated with Higher No-Show Rates**

Patients receiving financial support exhibit a higher no-show rate. This may indicate underlying socioeconomic barriers such as transportation, job instability, or competing responsibilities affecting attendance.

5.  **Waiting Time Is the Strongest Driver of No-Shows**

There is a clear and strong positive relationship between waiting time and no-show probability. As the gap between scheduling and appointment increases, attendance significantly declines. Patients scheduled more than 30 days in advance are 7 times more likely to miss appointments compared to same-day bookings. Lead time emerges as the most influential operational factor affecting attendance.

6.  **Patients with Chronic Conditions Show Higher Compliance**

Patients diagnosed with chronic conditions demonstrate lower no-show rates, suggesting that perceived health severity increases appointment adherence.

7.  **Repeat No-Show Behavior Exists but Is Concentrated**

3,160 out of 106,987 patients had multiple no-shows. This represents roughly 3% of patients, indicating that habitual non-attendance is concentrated within a small subset of the population. Although a small percentage of patients repeatedly miss appointments, they may contribute disproportionately to lost clinical capacity. This indicates the presence of a behavioral high-risk segment.

8.  **SMS Reminders Were Not Effective**

The data indicates that SMS reminders did not significantly reduce no-show rates. This suggests that:

-  Reminder timing may be suboptimal

-  Messaging may not be engaging

-  Structural barriers (e.g., transportation, schedule conflicts) outweigh reminder benefits

-  Reminders alone are insufficient to address attendance challenge

## Recommendations

-  Reduce waiting time between scheduling and appointment.

-  Prioritize same-week scheduling when possible.

-  Introduce “fast-track” slots for high-risk no-show groups.

-  Deploy Predictive Risk Flagging by using historical data to identify patients with prior no-shows, high waiting-time appointments and high-risk demographic groups.

-  Enhance SMS strategy by sending multiple reminders (e.g., 72h and 24h before appointment), allowing easy cancellation/rescheduling via SMS and personalizing reminder messaging.

-  Manage Habitual No-Show Patients by requesting appointment confirmation

-  Introduce reminder calls and consider penalty or deposit policies for habitual no-show patients.

## Conclusion

This analysis demonstrates that appointment attendance is influenced by behavioral, operational, and socioeconomic factors. By leveraging data-driven scheduling optimization and targeted patient engagement strategies, healthcare providers can significantly reduce no-show rates and improve system efficiency.

*Thank you for your time*














