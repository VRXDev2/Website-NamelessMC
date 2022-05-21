<label>{${$name|upper}}</label>
{if ${$name|upper}_VALUE !== ""}
    <span class="float-right">{$IU_UPLOAD_NEW}</span>
    <div class="card img-card">
        <img src="{${$name|upper}_VALUE}" />
        <span>{${$name|upper}_VALUE}</span>
        <button class="btn btn-danger float-right" name="{$name}-delete-btn" type='submit'><i class="fas fa-trash"></i></button>
    </div>
{else}
    <div class="d-flex flex-row align-items-center mt-2">
        <input type="file" name="cobalt-{$name}" id="cobalt-{$name}" class="position-absolute" style="margin-left:-500rem" onchange="switchToSubmit{$name}()">
        <label for="cobalt-{$name}" class="btn btn-primary mb-0" style="min-width: 130px" id="cobalt-{$name}-label">{$IU_CHOOSE_IMAGE}</label>
        <button type="submit" class="btn btn-success d-none" id="cobalt-{$name}-submit">{$IU_UPLOAD}</button>
        <span class="ml-3">{$IU_CLICK_UPLOAD}</span>
    </div>
    <br />
{/if}