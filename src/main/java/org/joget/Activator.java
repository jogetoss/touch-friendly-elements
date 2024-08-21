package org.joget;

import java.util.ArrayList;
import java.util.Collection;
import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceRegistration;

public class Activator implements BundleActivator {

    protected Collection<ServiceRegistration> registrationList;
    public final static String VERSION = "7.0.5";

    public void start(BundleContext context) {
        registrationList = new ArrayList<ServiceRegistration>();

        //Register plugin here
        registrationList.add(context.registerService(toggleSwitchField.class.getName(), new toggleSwitchField(), null));
        registrationList.add(context.registerService(rangeSliderField.class.getName(), new rangeSliderField(), null));
        registrationList.add(context.registerService(ListSelectionElement.class.getName(), new ListSelectionElement(), null));
    }

    public void stop(BundleContext context) {
        for (ServiceRegistration registration : registrationList) {
            registration.unregister();
        }
    }
}