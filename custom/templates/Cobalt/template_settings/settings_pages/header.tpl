                            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="pills-bgh-tab" data-toggle="pill" href="#pills-bgh"
                                        role="tab" aria-controls="pills-bgh" aria-selected="true">{$BG_TAB}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-bgo-tab" data-toggle="pill" href="#pills-bgo"
                                        role="tab" aria-controls="pills-bgo" aria-selected="false">{$BGO_TAB}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-logoh-tab" data-toggle="pill" href="#pills-logoh"
                                        role="tab" aria-controls="pills-logoh" aria-selected="false">{$LOGO_TAB}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-navbarh-tab" data-toggle="pill" href="#pills-navbarh"
                                        role="tab" aria-controls="pills-navbarh" aria-selected="false">{$NAVBAR_TAB}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-dsh-tab" data-toggle="pill" href="#pills-dsh"
                                        role="tab" aria-controls="pills-dsh" aria-selected="false">{$DS_TEXTS_TAB}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-loader-tab" data-toggle="pill" href="#pills-loader"
                                        role="tab" aria-controls="pills-loader" aria-selected="false">{$LOADER_TAB}</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-bgh" role="tabpanel"
                                    aria-labelledby="pills-bgh-tab">

                                    <label>{$HEADER_BG}</label>
                                    {if $HEADER_BG_VALUE !== ""}
                                        <span class="float-right">{$IU_UPLOAD_NEW}</span>
                                        <div class="card img-card">
                                            <img src="{$HEADER_BG_VALUE}" />
                                            <span>{$HEADER_BG_VALUE}</span>
                                            <button class="btn btn-danger float-right" name="headerbg-delete-btn"
                                                type='submit'><i class="fas fa-trash"></i></button>
                                        </div>
                                    {else}
                                        <div class="d-flex flex-row align-items-center" style="margin-top: 5px;">
                                            <input type="file" name="cobalt-headerbg" id="cobalt-headerbg"
                                                class="position-absolute" style="margin-left:-500rem"
                                                onchange="switchToSubmitheaderbg()">
                                            <label for="cobalt-headerbg" class="btn btn-primary mb-0"
                                                style="min-width: 130px"
                                                id="cobalt-headerbg-label">{$IU_CHOOSE_IMAGE}</label>
                                            <button type="submit" class="btn btn-success d-none"
                                                id="cobalt-headerbg-submit">{$IU_UPLOAD}</button>
                                            <span class="ml-3">{$IU_CLICK_UPLOAD}</span>
                                        </div>
                                        <br />
                                    {/if}

                                    {include file="./parts/switch.tpl" name=particles right=no last=no}

                                    <label>{$BG_HEIGHT}</label>
                                    <input type='text' name='bg_height' value='{$BG_HEIGHT_VALUE}' class='form-control'>
                                    <br />
                                    <label>{$BG_HEIGHT_M}</label>
                                    <input type='text' name='bg_height_m' value='{$BG_HEIGHT_M_VALUE}'
                                        class='form-control'>

                                    <br />
                                    <label>{$HEADER_BG_POSITION}</label>
                                    <select id="header_bg_position" class='form-control' name='header_bg_position'>
                                        <option value='top' {if $HEADER_BG_POSITION_VALUE eq 'top' } selected{/if}>
                                            {$TOP} </option>
                                        <option value='center' {if
                                            $HEADER_BG_POSITION_VALUE eq 'center' } selected{/if}>{$CENTER} </option>
                                        <option value='bottom' {if $HEADER_BG_POSITION_VALUE eq 'bottom' }
                                            selected{/if}>{$BOTTOM} </option>
                                    </select>
                                </div>
                                <div class="tab-pane fade" id="pills-bgo" role="tabpanel"
                                    aria-labelledby="pills-bgo-tab">

                                    {include file="./parts/switch.tpl" name=coverlay right=$COVERLAY_2 last=no}
                                    
                                    {include file="./parts/range.tpl" name=coverlay_opacity right=$COVERLAY_OPACITY_2 last=no}
                                        
                                    {include file="./parts/range.tpl" name=header_bg_shading right=$HEADER_BG_SHADING_2 last=no}
                                    
                                    {include file="./parts/switch.tpl" name=blur_header_bg right=no last=yes}
                                    <br /><span>{$BLUR_HEADER_BG_2}</span>

                                </div>
                                <div class="tab-pane fade" id="pills-logoh" role="tabpanel"
                                    aria-labelledby="pills-logoh-tab">
                                    
                                    {include file="./parts/image_uploader.tpl" name=logo}

                                    {include file="./parts/switch.tpl" name=al right=no last=no}

                                    <label>{$LOGO_SIZE}</label>
                                    <input type='text' name='logo_size' value='{$LOGO_SIZE_VALUE}' class='form-control'>
                                    <br />
                                    <label>{$LOGO_SIZE_M}</label>
                                    <input type='text' name='logo_size_m' value='{$LOGO_SIZE_M_VALUE}'
                                        class='form-control'>
                                </div>
                                <div class="tab-pane fade" id="pills-navbarh" role="tabpanel"
                                    aria-labelledby="pills-navbarh-tab">
                                    <label>{$NAVBAR}</label>
                                    <select id="navbar" class='form-control' name='navbar'>
                                        <option value='top' {if $NAVBAR_VALUE eq 'top' } selected{/if}>{$TOP} </option>
                                        <option value='bottom' {if $NAVBAR_VALUE eq 'bottom' } selected{/if}>{$BOTTOM}
                                        </option>
                                    </select> <br />
                                    <label>{$NAVBAR_ALIGNMENT}</label><span
                                        class="float-right">{$NAVBAR_ALIGNMENT_2}</span>
                                    <select id="navbar_alignment" class='form-control' name='navbar_alignment'>
                                        <option value='left' {if $NAVBAR_ALIGNMENT_VALUE eq 'left' } selected{/if}>
                                            {$LEFT} </option>
                                        <option value='center' {if
                                                $NAVBAR_ALIGNMENT_VALUE eq 'center' } selected{/if}>{$CENTER} </option>
                                    </select> <br />
                                    <label>{$NAVBAR_OFFSET}</label><br />

                                    <div class="card img-card">
                                        <i class="fas fa-info-circle"></i> <b>{$INFO}</b><br>
                                        {$NAVBAR_OFFSET_2}<br /><br />
                                        <b>{$NOTE}</b> {$NAVBAR_OFFSET_3}
                                    </div>

                                    <input type='text' name='navbar_offset' value='{$NAVBAR_OFFSET_VALUE}'
                                        class='form-control'>
                                    <br />
                                    <label>{$STORE_URL}</label><span class="float-right">{$STORE_URL_2}</span>
                                    <input type='text' name='store_url' value='{$STORE_URL_VALUE}'
                                        class='form-control'><br />

                                    {include file="./parts/switch.tpl" name=style_store_link right=no last=no}
                                    
                                    {include file="./parts/switch.tpl" name=nav_store_glow right=no last=yes}

                                </div>
                                <div class="tab-pane fade" id="pills-dsh" role="tabpanel"
                                    aria-labelledby="pills-dsh-tab">
                                    {include file="./parts/switch.tpl" name=ds_box right=no last=no}
                                    
                                    <label>{$DISCORD_SERVER}</label><span class="float-right"
                                        style="color: #dc3545"><b>{$DISCORD_SERVER_1}</b></span>
                                    <input type='text' name='discord_server' value='{$DISCORD_SERVER_VALUE}'
                                        class='form-control'>
                                    <br />
                                    <label>{$DISCORD_SERVER_ID}</label>
                                    <input type='text' name='discord_server_id' value='{$DISCORD_SERVER_ID_VALUE}'
                                        class='form-control'>
                                    <br />
                                    <label>{$MC_SERVER}</label>
                                    <input type='text' name='mc_server' value='{$MC_SERVER_VALUE}' class='form-control'>
                                    <br />
                                    <label>{$DS_BREAKPOINT}</label><span class="float-right">{$DS_BREAKPOINT_2}</span>
                                    <input type='text' name='ds_breakpoint' value='{$DS_BREAKPOINT_VALUE}'
                                        class='form-control'>
                                </div>
                                <div class="tab-pane fade" id="pills-loader" role="tabpanel"
                                    aria-labelledby="pills-loader-tab">
                                    {include file="./parts/switch.tpl" name=loading_animation right=no last=no}
                                    
                                    <label>{$LOADER_COLOR}</label>
                                    <div class="input-group loader-color">
                                        <span class="input-group-prepend">
                                            <span class="input-group-text colorpicker-input-addon"><i></i></span>
                                        </span>
                                        <input type='text' name='loader_color' value='{$LOADER_COLOR_VALUE}'
                                            class='form-control'>
                                    </div>
                                </div>
                            </div>