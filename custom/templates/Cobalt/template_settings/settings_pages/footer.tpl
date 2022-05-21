                            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="pills-generalf-tab" data-toggle="pill"
                                        href="#pills-generalf" role="tab" aria-controls="pills-generalf"
                                        aria-selected="true">{$GENERAL}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-pnf-tab" data-toggle="pill" href="#pills-pnf"
                                        role="tab" aria-controls="pills-pnf" aria-selected="true">{$PNF_TAB}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-otherf-tab" data-toggle="pill" href="#pills-otherf"
                                        role="tab" aria-controls="pills-otherf"
                                        aria-selected="false">{$OTHER_SECTION_TAB}</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-generalf" role="tabpanel"
                                    aria-labelledby="pills-generalf-tab">
                                    <label>{$FOOTER_SIZE}</label>
                                    <select class='form-control' name='footer_size'>
                                        <option value='large' {if $FOOTER_SIZE_VALUE eq 'large' } selected{/if}>{$LARGE}
                                        </option>
                                        <option value='small' {if $FOOTER_SIZE_VALUE eq 'small' } selected{/if}>{$SMALL}
                                        </option>
                                    </select>
                                </div>
                                <div class="tab-pane fade" id="pills-pnf" role="tabpanel"
                                    aria-labelledby="pills-pnf-tab">
                                    <label>{$PLAY_T}</label>
                                    <input type='text' name='play_t' value='{$PLAY_T_VALUE}' class='form-control'><br />
                                    <label>{$PLAY_D}</label>
                                    <input type='text' name='play_d' value='{$PLAY_D_VALUE}' class='form-control'><br />
                                    {include file="./parts/switch.tpl" name=play_b right=no last=yes}
                                </div>
                                <div class="tab-pane fade" id="pills-otherf" role="tabpanel"
                                    aria-labelledby="pills-otherf-tab">
                                    <label>{$OTHER_T}</label>
                                    <input type='text' name='other_t' value='{$OTHER_T_VALUE}'
                                        class='form-control'><br />
                                    <label>{$OTHER_D}</label>
                                    <input type='text' name='other_d' value='{$OTHER_D_VALUE}'
                                        class='form-control'><br />
                                    <label>{$OTHER_BT}</label>
                                    <input type='text' name='other_bt' value='{$OTHER_BT_VALUE}'
                                        class='form-control'><br />
                                    <label>{$OTHER_BL}</label>
                                    <input type='text' name='other_bl' value='{$OTHER_BL_VALUE}'
                                        class='form-control'><br />
                                    <label>{$OTHER_BI}</label><span class="float-right">{$BLANK}</span>
                                    <input type='text' name='other_bi' value='{$OTHER_BI_VALUE}' class='form-control'>
                                </div>
                            </div>