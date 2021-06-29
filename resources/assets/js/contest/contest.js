contestDescriptionEditor = "";
var Contest = { 
    descriptionEditor: "",
    setEditor: function(description) {
        contestDescriptionEditor = CKEDITOR.replace('contestDescriptionEditor');
        CKEDITOR.config.height = 100;
        CKEDITOR.config.enterMode = CKEDITOR.ENTER_BR;
        CKEDITOR.config.extraPlugins = 'mathjax,autogrow,justify,image2,div,coderojpreview,coderojfilemanager';
        CKEDITOR.config.mathJaxLib = 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS_HTML';
        CKEDITOR.config.mathJaxClass = 'equation';
        CKEDITOR.config.codeSnippet_theme = 'pojoaque';
        CKEDITOR.config.fontSize_defaultLabel = '12px';
        CKEDITOR.config.disableObjectResizing = false;
        CKEDITOR.config.autoGrow_minHeight = 100;
        CKEDITOR.config.autoGrow_maxHeight = 300;
        CKEDITOR.config.tabSpaces = 4;

        var toolbarConstraintsEditor = [{
            name: "paragraph",
            items: ['Bold', 'Italic', 'Strike']
        }, {
            name: "paragraph",
            items: ["NumberedList", "BulletedList"]
        }, {
            name: 'basicstyles',
            groups: ['basicstyles', 'cleanup'],
            items: ['CreateDiv', 'Link', 'Image', 'CoderojFileManager', 'Table', 'Mathjax']
        }, {
            name: "paragraph",
            items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
        }, {
            name: 'tools',
            items: ['CoderojPreview', 'Maximize']
        }];
        contestDescriptionEditor.config.toolbar = toolbarConstraintsEditor;
        //descriptionEditor = this.descriptionEditor;
        CKEDITOR.instances.contestDescriptionEditor.setData(atob(description));
    },
    create: function() {
        var form = new Form("create_contest");
        form.submit({
            loadingText: "Creating...",
            success: {
                resetForm: true,
                callback: function(response) {
                    url.load(response.url);
                    new Modal().close();
                }
            }
        });
    },
    update: function() {
        var form = new Form("updateContestForm");
        var formData = new FormData(document.getElementById("updateContestForm"));
        formData.append('description', CKEDITOR.instances.contestDescriptionEditor.getData());
        //return;
        form.submit({
            loadingText: "Updating...",
            defaultForm: formData,
            success: {
                resetForm: false,
                callback: function(response) {
                    // url.load();
                    // new Modal().close();
                }
            }
        });
    },
    loadFileBanner: function(event) {
        var output = document.getElementById('contestBannerPreview');
        if (!event.target.files[0]) {
            // output.src = $('#img-preview-default').attr('src');
        } else output.src = URL.createObjectURL(event.target.files[0]);
        output.onload = function() {
            URL.revokeObjectURL(output.src) // free memory
        }
    },
    addProblem: function(e) {
        var problemSlug = prompt("Enter problem Slug");
        if (problemSlug == null) return;
        var addUrl = e.attr("url");
        var data = {
            'slug': problemSlug
        };
        $.post(addUrl, app.setToken(data), function(response) {
            url.load();
            toast.success(response.message);
        }).fail(function(error) {
            toast.danger("Problem Added Error");
        });
        // console.log(problemSlug);
    },
    removeProblem: function(e) {
        var ok = confirm("Are you want to remove problem");
        if (!ok) return;
        var removeUrl = e.attr("url");
        $.post(removeUrl, app.setToken(), function(response) {
            url.load();
            toast.success(response.message);
        });
        // console.log(problemSlug);
    },
    generateTempUser: function(e) {
        var form = new Form("generateTempUser");
        form.submit({
            loadingText: "Creating...",
            success: {
                resetForm: true,
                callback: function(response) {
                    url.load();
                    //new Modal().close();
                }
            }
        });
    },
    checkAllRegistrationList(e) {
        $("input[name='registrations[]']").attr('checked', e.checked);
    },
    updateParticipantRegistration: function(e) {
        var registrationList = [];
        $("input[name='registrations[]']:checked").each(function(index, obj) {
            registrationList.push(obj.value);
        });
        if (registrationList.length == 0) {
            alert("You can not select any row");
            return;
        }
        var ok = confirm("Are You Want " + e.attr('status') + " Registration");
        if (!ok) return;
        var data = {
            'user_list': registrationList,
            'status': e.attr('status')
        };
        $.post(e.attr("url"), app.setToken(data), function(response) {
            if (e.attr('status') == "Pending") toast.warning(response.message);
            else if (e.attr('status') == "Accepted") toast.success(response.message);
            else toast.danger(response.message);
            $("#checkAllRegistrationList").prop("checked", false);
            registrationDataTable.ajax.reload(null, false);
        });
    },
    contestTimer: 0,
    contestStatus: 0,
    startTime: 0,
    setTimer: function(timer, status) {
        this.contestTimer = timer;
        this.contestStatus = status;
        this.startTime = this.currTimeSecond();
    },
    timeConvert: function(timeDiffrent) {
        timeDiffrent = timeDiffrent <= 0 ? 0 : timeDiffrent;
        hour = Math.floor(timeDiffrent / 3600);
        timeDiffrent -= hour * 3600;
        minute = Math.floor(timeDiffrent / 60);
        timeDiffrent -= minute * 60;
        second = timeDiffrent;
        if (hour < 10) hour = "0" + hour;
        if (minute < 10) minute = "0" + minute;
        if (second < 10) second = "0" + second;
        var data = {
            'hour': hour,
            'minute': minute,
            'second': second
        }
        return data;
    },
    currTimeSecond: function() {
        return new Date().getTime() / 1000 | 0;
    },
    processTimer: function() {
        var start = $("#startcontesttimer").val();
        if (!start) return;
        if(this.contestTimer == 0)return;
        
        var currTime = this.currTimeSecond();
        calSeconds = this.contestTimer - (currTime - this.startTime);

        if (calSeconds == 0) this.contestTimer = 0;

        time = this.timeConvert(calSeconds);
        $("#timerArea").html(time.hour+" : "+time.minute+" : "+time.second);

        if (calSeconds == 0) {
            var statusMessage = "";
            if (this.contestStatus == "running") statusMessage = "Contest Is End";
            else if (this.contestStatus == "upcomming") statusMessage = "Contest Is Start";
            alert(statusMessage);
            $("#contestStatusTxt").html(statusMessage);
            url.load();
        }
    }
};
setInterval(function() {
    Contest.processTimer();
}, 1000);