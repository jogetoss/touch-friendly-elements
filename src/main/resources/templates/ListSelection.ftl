<div class="form-cell" ${elementMetaData!}>
    <label field-tooltip="${elementParamName!}" class="label" for="${elementParamName!}">${element.properties.label} <span class="form-cell-validator">${decoration}</span><#if error??> <span class="form-error-message">${error}</span></#if></label>
    <div class="form-cell-value listDiv" id="${elementParamName!}${element.properties.elementUniqueKey!}">
    <#list options as option>
        <#if (element.properties.readonly! == 'true' && element.properties.readonlyLabel! == 'true') >
            <#if values?? && values?seq_contains(option.value!)>
                <label class="readonly_label">
                    <span>${option.label!?html}</span>
                    <input id="${elementParamName!}" name="${elementParamName!}" type="hidden" value="${option.value!?html}" />
                </label>
            </#if>
        <#else>
            <label tabindex="0" class="listSelection">
                <#if element.properties.readonly! == 'true' && values?? && values?seq_contains(option.value!)>
                    <input id="${elementParamName!}" name="${elementParamName!}" type="hidden" value="${option.value!?html}" />
                </#if>
                <input grouping="${option.grouping!?html}" <#if element.properties.readonly! != 'true'>id="${elementParamName!}" name="${elementParamName!}"</#if> type="checkbox" value="${option.value!?html}" <#if error??>class="form-error-cell"</#if> <#if element.properties.readonly! == 'true'> disabled</#if> <#if values?? && values?seq_contains(option.value!)>checked</#if> />
                <i style="float: right;margin-bottom: 10px;border: none;background: none;"></i>
                ${option.label!?html}
            </label>
        </#if>
    </#list>
    </div>
    <div style="clear:both;"></div>

    <#if (element.properties.controlField?? && element.properties.controlField! != "" && !(element.properties.readonly! == 'true' && element.properties.readonlyLabel! == 'true')) >
        <script type="text/javascript">
            $(document).ready(function(){
                $("#${elementParamName!}${element.properties.elementUniqueKey!}").dynamicOptions({
                    controlField : "${element.properties.controlFieldParamName!}",
                    paramName : "${elementParamName!}",
                    type : "checkbox",
                    readonly : "${element.properties.readonly!}",
                    nonce : "${element.properties.nonce!}",
                    binderData : "${element.properties.binderData!}",
                    appId : "${element.properties.appId!}",
                    appVersion : "${element.properties.appVersion!}",
                    contextPath : "${request.contextPath}"
                });
            });
        </script>
    </#if>
    <style>
        .listSelection{
            outline: 0px;
            width:100% !important;
            padding: 10px 15px 3px 15px;
            border: 1px solid #ddd;
            border-bottom: 0px;
            margin-bottom: 0px;
        }

        <#if element.properties.readonlyLabel! != 'true' >
        .listDiv{
            border-bottom: 1px solid #ddd;
        }
        </#if>

        body .listSelection > input[type=checkbox] + i:after {
            font: normal normal normal 14px/1 FontAwesome;
            display: inline-block;
            width: 30px;
            cursor: pointer;
            vertical-align: middle;
            opacity: 0;
        }

        body .listSelection > input[type=checkbox]:disabled + i:after {
            opacity: 0;
        }

        body .listSelection > input[type=checkbox]:checked + i:after {
            color: #2196F3;
            opacity: 1;
            background: none;
            border: none;
            margin: 0px;
        }
        
        body .listSelection > input[type="checkbox"]{
            float: right;
        }
    </style>
</div>