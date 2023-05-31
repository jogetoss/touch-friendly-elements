<div class="form-cell" ${elementMetaData!}>
    <label field-tooltip="${elementParamName!}" class="label" for="${elementParamName!}">${element.properties.label} <span class="form-cell-validator">${decoration}</span><#if error??> <span class="form-error-message">${error}</span></#if></label>
    <div class="form-cell-value" id="${elementParamName!}${element.properties.elementUniqueKey!}">
        <#if (element.properties.readonly! == 'true' && element.properties.readonlyLabel! == 'true') >
            <input id="${elementParamName!}" name="${elementParamName!}" type="hidden" value="${value!?html}"/>
                <label class="readonly_label">
                    <span>${value!?html}</span>
                </label>
        <#else>
                <label tabindex="0" class="switch">
                    <input id="${elementParamName!}" name="${elementParamName!}" type="hidden" value="${value!?html}"/>
                    <input <#if element.properties.readonly! != 'true'>id="${elementParamName!}_ui"</#if> type="checkbox" value="${element.properties.onCheckValue!}" <#if error??>class="form-error-cell"</#if> <#if element.properties.readonly! == 'true'> disabled</#if> <#if value?? && value == element.properties.onCheckValue!>checked</#if> />              
                    <span class="tSlider round"></span>
                </label>
        </#if>
    </div>
    <div style="clear:both;"></div>
    <script type="text/javascript">
        $(document).ready(function(){
           if (document.getElementById('${elementParamName!}_ui') !== null){
                document.getElementById('${elementParamName!}_ui').addEventListener('change', (e) => {
                    this.checkboxValue = e.target.checked ? '${element.properties.onCheckValue!}' : '${element.properties.notOnCheckValue!}';
                    $('input[name=${elementParamName!}]').val(this.checkboxValue);
                })           
            }
        });
    </script>
    <#if !(request.getAttribute("org.joget.toggleSwitchField")??) >
        <style>
           .switch{position:relative; display:inline-block; width:60px; height:34px; outline:0px;}
           .switch input{opacity:0; width:0; height:0;}
           .tSlider{position:absolute; cursor:pointer; top:0; left:0; right:0; bottom:0; background-color:#ccc; -webkit-transition: .4s; transition: .4s; width: 60px;}
           .tSlider:before{position:absolute; content: ""; height:26px; width:26px; left:4px; bottom:4px; background-color:white; -webkit-transition:.4s; transition:.4s;}
           input:checked+.tSlider{background-color:#2196F3;}
           input:focus+.tSlider{box-shadow: 0 0 1px #2196F3;}
           input:checked+.tSlider:before{-webkit-transform:translateX(26px); -ms-transform: translateX(26px); transform: translateX(26px);}
           .tSlider.round{border-radius:34px;}
           .tSlider.round:before{border-radius:50%;}
        </style>
    </#if>
</div>