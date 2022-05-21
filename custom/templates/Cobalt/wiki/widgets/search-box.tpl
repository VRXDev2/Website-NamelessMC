<form action='{if $PAGE_RESULT == 1}{if $WP_TYPE}{else}wiki/{/if}../{else}{/if}' method ='GET'>
    <div class="input-group mb-3">
        <input class="form-control input-sm" type="text" name="search" id="search" value="{$SEARCH_RESULT}" placeholder="{$SEARCH_PLACEHOLDER}">
        <span class="input-group-btn">
		    <button type="submit" class="btn btn-theme">
		        <i class="fa-solid fa-magnifying-glass"></i>
		    </button>
		</span>
    </div>
</form>