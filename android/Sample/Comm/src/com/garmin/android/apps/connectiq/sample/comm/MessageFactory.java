/**
 * Copyright (C) 2015 Garmin International Ltd.
 * Subject to Garmin SDK License Agreement and Wearables Application Developer Agreement.
 */
package com.garmin.android.apps.connectiq.sample.comm;

import java.util.HashMap;
import java.util.Map;

import android.content.Context;

public class MessageFactory {

    public static Object getMessage(Context context, int whichMsg) {

        switch(whichMsg) {
            default:
            case 0: // hello_world
                return context.getString(R.string.hello_world_message);
            case 1: // short_string
                return context.getString(R.string.short_string_message);
            case 2: // medium_string
                return context.getString(R.string.medium_string_message);
            case 3: // long_string
                return context.getString(R.string.long_string_message);
            case 4: // absurd_string
                return context.getString(R.string.absurd_message);
            case 5: // array
                {
                    Object[] data = new Object[] {"An", "array", "of", "strings", "and", "one", "pi", Double.valueOf(3.14159265359)};
                    return data;
                }
            case 6: // dictionary
                {
                    Map<String, Object> dictionary = new HashMap<String, Object>();
                    dictionary.put("key1", "value1");
                    dictionary.put("key2", null);
                    dictionary.put("key3", 42);
                    dictionary.put("key4", 123.456);
                    return dictionary;
                }
            case 7: // complex
                {
                    Object[] data = new Object[5];
                    data[0] = "A string";
                    data[1] = new String[] {"A", "nested", "array"};

                    Map<Object, Object> nestedDictionary = new HashMap<Object, Object>();
                    nestedDictionary.put("one", 1);
                    nestedDictionary.put("two", 2);
                    nestedDictionary.put("three", 3);
                    nestedDictionary.put("four", 4);
                    nestedDictionary.put("five", 5);
                    nestedDictionary.put(1.61803, "G.R.");

                    Map<String, Object> dictionary = new HashMap<String, Object>();
                    dictionary.put("key1", "A nested dictionary");
                    dictionary.put("key2", "three strings...");
                    dictionary.put("key3", "and one array");
                    dictionary.put("key4", new Object[] {"This array has two strings", "and a nested dictionary!", nestedDictionary});

                    data[2] = dictionary;
                    data[3] = "And one last  null";
                    data[4] = null;

                    return data;
                }
        }
    }
}
