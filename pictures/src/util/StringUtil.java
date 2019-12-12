package util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {
    public static String getPicName(String s) {
        Pattern p = Pattern.compile("(.*)(\\.)(png|jpg)", Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
        Matcher m = p.matcher(s);
        if (m.matches()) {
            return m.group(3);
        } else {
            return null;
        }
    }
}
