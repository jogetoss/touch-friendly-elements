<div class="form-cell" ${elementMetaData!}>
    <label field-tooltip="${elementParamName!}" class="label" for="${elementParamName!}">${element.properties.label} <span class="form-cell-validator">${decoration}</span><#if error??> <span class="form-error-message">${error}</span></#if></label>
        <div class="form-cell-value" id="${elementParamName!}${element.properties.elementUniqueKey!}">
            <#if (element.properties.readonly! == 'true' && element.properties.readonlyLabel! == 'true') >
                <input id="${elementParamName!}" name="${elementParamName!}" type="hidden" value="${value!?html}"/>
                <label class="readonly_label">
                    <span>${value!?html}</span>
                </label>
            <#else>
                <label tabindex="0" class="slidecontainer">
                    <input type="range" min="${element.properties.minValue!}" max="${element.properties.maxValue!}" value="${value!?html}" class="rangeSlider" name="${elementParamName!}" <#if element.properties.readonly! != 'true'>id="${elementParamName!}"</#if> <#if element.properties.readonly! == 'true'> disabled</#if> style="touch-action: none;"/>
                    <p style="text-align:center;"><span id="${elementParamName!}_value"><#if (element.properties.readonly! == 'true' && element.properties.readonlyLabel! != 'true')>${value!?html}</#if></span></p>
                </label>
            </#if>
        </div>
    <div style="clear:both;"></div>
    <script type="text/javascript">
        $(document).ready(function(){
            if (document.getElementById('${elementParamName!}') !== null && document.getElementById('${elementParamName!}_value') !== null){
                var slider_${elementParamName!} = document.getElementById("${elementParamName!}");
                var output_${elementParamName!} = document.getElementById("${elementParamName!}_value");
                output_${elementParamName!}.innerHTML = slider_${elementParamName!}.value;

                slider_${elementParamName!}.oninput = function() {
                output_${elementParamName!}.innerHTML = this.value;
                }
            }
        });
    </script>
    <#if !(request.getAttribute("org.joget.rangeSliderField")??) >
        <style>
            @media screen and (max-width: 480px) {
            .slidecontainer {width: 100% !important;}
            }

            @media screen and (min-width: 481px) {
            .slidecontainer {width: 70% !important;}
            }

            .slidecontainer {outline: 0;}

            .rangeSlider {
                -webkit-appearance: none;
                width: 100%;
                height: 7px;
                border-radius: 5px;  
                background: #d3d3d3;
                background-image: linear-gradient(to right, #e4e4e4 , #c5c5c5);
                outline: none;
                opacity: 0.7;
                -webkit-transition: .2s;
                transition: opacity .2s;
            }

            .rangeSlider:hover {
                opacity: 1;
            }

            .rangeSlider::-webkit-slider-thumb {
                -webkit-appearance: none;
                appearance: none;
                width: 23px;
                height: 23px;
                border-radius: 50%; 
                background: #fff;
                border: 3px solid #1890ff;
                cursor: pointer;
            }

            .rangeSlider::-moz-range-thumb {
                width: 23px;
                height: 23px;
                border-radius: 50%;
                background: #fff;
                border: 3px solid #1890ff;
                cursor: pointer;
            }
        </style>
    </#if>
</div>