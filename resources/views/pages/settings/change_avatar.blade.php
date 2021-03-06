@extends("pages.settings.settings")
@section('title', 'Change Avatar')
@section('setting-sub-content')
    <style type="text/css">
        .form {}

        .form .form-control-input {
            padding: 10px;
            width: 100%;
            border-radius: 3px;
            font-size: 14px;
            color: #585a58;
            border: 1px solid #d4d4d4;
            background-color: #f9f9f9;

        }

        .form .form-control-input:focus,
        .form-control:focus {
            outline: none;
            border-radius: 5px;
            border: 1px solid var(--blue);
            box-shadow: 0 0 3px 3px #CCC7D8;
        }

        .form .form-control-input {
            margin-bottom: 5px;
        }

        .form .label-area {
            text-align: right;
        }

        @media (max-width: 995px) {
            .form .label-area {
                text-align: left;
            }
        }

        .form label {
            margin-left: 5px;
            margin-top: 12px;
            font-size: 13px;
            color: #aaaaaa;
        }

        .form .error-area,
        .success-area {
            display: none;
        }

        .form .submit-btn {
            background-color: #305485;
            min-width: 200px;
            color: #ffffff;
            padding: 9px;
            font-weight: bold;
        }

        .form .submit-btn:focus {
            outline: none;
        }

        .form .error-input {
            border: solid 1px #ce9999;
        }

        .form .alert-area {
            margin-bottom: 15px;
        }

    </style>
    <form style="width: 70%" action="{{ route('profile.update_avatar') }} " class="form" id="change_avatar" method="post"
        enctype="multipart/form-data">
        @csrf
        <div class="alert-area">
            <div class="alert alert-danger error-area"></div>
            <div class="alert alert-success success-area"></div>
        </div>
        <div class='row' style="margin-bottom: 5px;">
            <div class='col-md-4 label-area'>
                <label> Avatar <font color="red">*</font>:</label>
            </div>
            <div class="col-md-8">
                <img id="img-preview-default" src="{{ auth()->user()->avatar }}" style="display: none">
                <img id="img-preview" src="{{ auth()->user()->avatar }}" height="100" width="100" class="img-thumbnail"
                    style="margin-bottom: 10px;">
                <input type="file" class='form-control-input' accept="image/*" value='' name="avatar"
                    onchange="profile.loadFileAvatar(event)" placeholder="Select your new avatar">
            </div>
        </div>
        <div class='row'>
            <div class="col-md-4"></div>
            <div class="col-md-8">
                <div style="">
                    <button type="submit" class="btn btn-primary" style="margin-top: 15px;"
                        onclick="profile.changeAvatar()">Change Avatar</button>
                </div>
            </div>
        </div>
    </form>
@stop
