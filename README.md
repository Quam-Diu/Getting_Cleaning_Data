# Getting_Cleaning_Data
Repository for the course project of Getting and Cleaning Data, from Coursera


transmute(act_subtbl, ifelse(activity_label == 1, "WALKING", activity_label))
transmute(act_subtbl, ifelse(activity_label == 2, "WALKING_UPSTAIRS", activity_label))
transmute(act_subtbl, ifelse(activity_label == 5, "STANDING", activity_label))
act_subtbl$activity_label <- ifelse(act_subtbl$activity_label == act_labels[i,1], act_labels[i,2], act_subtbl$activity_label)
for (i in nrow(act_labels)) {
         act_subtbl$activity_label <- ifelse(act_subtbl$activity_label == act_labels[i,1], act_labels[i,2], act_subtbl$activity_label)
 }
