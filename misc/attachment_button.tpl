
<div>
    <div class="attachment-button">
        <button class="btn btn-large btn-primary">
            <i class="material-icons ic_add_a_photo" style="vertical-align: text-top"></i> 
            <{if true}> <!-- якщо фото не обране -->
                <{t 'Select_upload_photo'}>
            <{else}> <!-- якщо фото обране -->
                <{t 'Change_to_another_photo'}>
            <{/if}>
        </button>
    </div>

    <div class="attachment-img">
    </div>
</div>
