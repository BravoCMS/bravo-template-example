
<div class="modal pu-attachmentSelector drop-area" tabindex="-1" role="dialog" url="<{$smarty.get.url}>" filename="<{$smarty.get.filename|escape}>" ratioW="<{$imageSettings.ratioW}>" ratioH="<{$imageSettings.ratioH}>" minW="<{$imageSettings.minW}>" minH="<{$imageSettings.minH}>">
    <input type="file" multiple="multiple" class="hide" id="upload-button<{$smarty.get.jsonAttachment}>-<{$smarty.get.callback}>" />

    <div class="modal-dialog modal-dialog-add-photo">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close">
                    <span aria-hidden="true"><i class="material-icons ic_highlight_off"></i></span>
                </button>
                <h4 class="modal-title"><{t 'Uploading_and_selecting_photos'}></h4>
            </div>
            <div class="modal-body">
                <div class="modal-body-content">
                    <div class="js-attachment-msg js-attachment-msg-default hide alert alert-info">
                        <{t 'To_select_another_photo'}>
                    </div>
                    <div class="js-attachment-msg js-attachment-msg-not-selected hide alert alert-warning">
                        <{t 'Select_a_photo_by_clicking_on_it'}>
                    </div>
                    <div class="js-attachment-msg js-attachment-msg-no-photo hide alert alert-danger">
                        <{t 'You_have_no_photo_upload_photo_first'}>
                    </div>
                    <div class="attachment-area">
                        <div class="attachment-wrapper">
                            <div class="attachments row js-l-scope">
                                <{include file="misc/attachment_list.tpl"}>
                            </div>
                            <div class="attachment-upload">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="form-inline" style="padding-bottom: 15px;">
                    <div class="form-group">
                        <input type="text" class="form-control js-url-upload-field" placeholder="<{t 'Upload_file_by_URL'}>" />

                        <button type="button" class="btn btn-success hide js-url-upload-button">
                            <{t 'Загрузить'}>
                        </button>
                    </div>

                    <label for="upload-button<{$smarty.get.jsonAttachment}>-<{$smarty.get.callback}>" class="btn btn-success btn-large">
                        <{t 'Select_files_to_upload'}>
                    </label>
                </div>

                <button type="button" class="save btn btn-primary js-add-selected-photo">
                    OK 
                    <span class="js-show-only-multiple hide">(<{t 'Selected_photos'}>: <span class="js-select-img-count"></span>)</span>
                </button>

                <button type="button" class="js-select-all-img js-show-only-multiple btn btn-info hide">
                    <{t 'Choose_all'}>
                </button>

                <button type="button" class="js-unselect-all-img js-show-only-multiple btn btn-danger hide">
                    <{t 'Unselect_all'}>
                </button>

                <button type="button" class="btn btn-warning" data-dismiss="modal">
                    <{t 'Cancel'}>
                </button>
            </div>
        </div>
    </div>
</div>
