package org.joget;

import java.util.Map;
import org.joget.apps.app.service.AppPluginUtil;
import org.joget.apps.app.service.AppUtil;
import org.joget.apps.form.lib.CheckBox;
import org.joget.apps.form.model.FormBuilderPalette;
import org.joget.apps.form.model.FormBuilderPaletteElement;
import org.joget.apps.form.model.FormData;
import org.joget.apps.form.model.FormRow;
import org.joget.apps.form.model.FormRowSet;
import org.joget.apps.form.service.FormUtil;
import org.joget.commons.util.SecurityUtil;

public class rangeSliderField extends CheckBox implements FormBuilderPaletteElement {
    
    private final static String MESSAGE_PATH = "messages/mobileFormElements";
    
    @Override
    public String getName() {
        return AppPluginUtil.getMessage("form.mobile.element.rangeSlider.label", getClassName(), MESSAGE_PATH);
    }

    @Override
    public String getVersion() {
        return "7.0.3";
    }

    @Override
    public String getDescription() {
        return AppPluginUtil.getMessage("form.mobile.element.rangeSlider.description", getClassName(), MESSAGE_PATH);
    }

    @Override
    public FormRowSet formatData(FormData formData) {

        FormRowSet rowSet = null;

        // get value
        String id = getPropertyString(FormUtil.PROPERTY_ID);
        if (id != null) {
            String value = FormUtil.getElementPropertyValue(this, formData);
            if (value != null) {
                // set value into Properties and FormRowSet object
                FormRow result = new FormRow();
                result.setProperty(id, value);
                rowSet = new FormRowSet();
                rowSet.add(result);
            }
        }
        return rowSet;
    }

    @Override
    public String renderTemplate(FormData formData, Map dataModel) {
        String template = "rangeSlider.ftl";

        // set value
        String value = FormUtil.getElementPropertyValue(this, formData);

        value = SecurityUtil.decrypt(value);

        dataModel.put("value", value);

        String html = FormUtil.generateElementHtml(this, formData, template, dataModel);
        return html;
    }
    
    @Override
    public Boolean selfValidate(FormData formData) {
        Boolean valid = true;
        String id = FormUtil.getElementParameterName(this);
        int value = Integer.parseInt(FormUtil.getElementPropertyValue(this, formData));
        int minValue = Integer.parseInt(getPropertyString("minValue"));
        int maxValue = Integer.parseInt(getPropertyString("maxValue"));

        if (!(value >= minValue && value <= maxValue)) {
            valid = false;
            formData.addFormError(id, AppPluginUtil.getMessage("form.mobile.element.rangeSlider.errorMsg", getClassName(), MESSAGE_PATH));
        }
        return valid;
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
        return AppPluginUtil.getMessage("form.mobile.element.rangeSlider.label", getClassName(), MESSAGE_PATH);
    }

    @Override
    public String getPropertyOptions() {
        return AppUtil.readPluginResource(getClass().getName(), "/properties/rangeSlider.json", null, true, MESSAGE_PATH);
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
        return "<i class=\"fas fa-sliders-h\"></i>";
    }
}
