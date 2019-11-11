package com.nuc.oa.global;

import java.util.Calendar;


public class DateUtil {
    public static int getWorkDay(int curYear, int curMonth) {
        int count = 0;
        int year = curYear;
        int month = curMonth;
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month - 1);
        cal.set(Calendar.DATE, 1);
        while (cal.get(Calendar.MONTH) < month) {
            int day = cal.get(Calendar.DAY_OF_WEEK);
            if (!(day == Calendar.SUNDAY || day == Calendar.SATURDAY)) {
                count++;
            }
            cal.add(Calendar.DATE, 1);
        }
        return count;
    }
}
