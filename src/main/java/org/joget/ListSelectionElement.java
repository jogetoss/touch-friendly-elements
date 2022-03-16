package org.joget;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import org.joget.apps.app.service.AppPluginUtil;
import org.joget.apps.app.service.AppUtil;
import org.joget.apps.form.lib.CheckBox;
import org.joget.apps.form.model.FormBuilderPalette;
import org.joget.apps.form.model.FormBuilderPaletteElement;
import org.joget.apps.form.model.FormData;
import org.joget.apps.form.service.FormUtil;

public class ListSelectionElement extends CheckBox implements FormBuilderPaletteElement {
    
    private final static String MESSAGE_PATH = "messages/mobileFormElements";
    
    @Override
    public String getName() {
        return AppPluginUtil.getMessage("form.mobile.element.listSelection", getClassName(), MESSAGE_PATH);
    }

    @Override
    public String getVersion() {
        return "7.0.1";
    }

    @Override
    public String getDescription() {
        return AppPluginUtil.getMessage("form.mobile.element.listSelection.description", getClassName(), MESSAGE_PATH);
    }

    
    @Override
    public String renderTemplate(FormData formData, Map dataModel) {
        String template = "ListSelection.ftl";
        
        dynamicOptions(formData);
        
        // set value
        String[] valueArray = FormUtil.getElementPropertyValues(this, formData);
        List<String> values = Arrays.asList(valueArray);
        dataModel.put("values", values);

        // set options
        Collection<Map> optionMap = getOptionMap(formData);
        dataModel.put("options", optionMap);

        String html = FormUtil.generateElementHtml(this, formData, template, dataModel);
        return html;
    }

    @Override
    public String getClassName() {
        return getClass().getName();
    }

    @Override
    public String getFormBuilderTemplate() {
        return "<label class='label'>" + getLabel() + "</label>";
    }

    @Override
    public String getLabel() {
        return AppPluginUtil.getMessage("form.mobile.element.listSelection", getClassName(), MESSAGE_PATH);
    }

    @Override
    public String getPropertyOptions() {
        return AppUtil.readPluginResource(getClass().getName(), "/properties/ListSelection.json", null, true, MESSAGE_PATH);
    }

    @Override
    public String getFormBuilderCategory() {
        return FormBuilderPalette.CATEGORY_GENERAL;
    }

    @Override
    public int getFormBuilderPosition() {
        return 400;
    }

    @Override
    public String getFormBuilderIcon() {
        return "<i class=\"far fa-list-alt\"></i>";
    }
}
