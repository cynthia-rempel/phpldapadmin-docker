# Changes tested in PHP code
Changes tested, that don't break the application. NOTE: they are NOT in the image, just determined to not break it.

## First try: limit username to characters valid for URL
/usr/share/phpldapadmin/htdocs/login.php

$user['login'] = filter_var(get_request('login'),FILTER_SANITIZE_URL);

$user['password'] = filter_var(get_request('login_pass'),FILTER_SANITIZE_URL);

# Places to look for more changes...

/usr/share/phpldapadmin/htdocs/add_attr_form.php:$request['dn'] = get_request('dn','GET');
/usr/share/phpldapadmin/htdocs/add_attr_form.php:$request['page'] = new TemplateRender($app['server']->getIndex(),get_request('template','REQUEST',false,null));
/usr/share/phpldapadmin/htdocs/add_attr_form.php:if (get_request('meth','REQUEST') != 'ajax') {
/usr/share/phpldapadmin/htdocs/add_oclass_form.php:$request['dn'] = get_request('dn','REQUEST',true);
/usr/share/phpldapadmin/htdocs/add_oclass_form.php:$request['page'] = new TemplateRender($app['server']->getIndex(),get_request('template','REQUEST',false,null));
/usr/share/phpldapadmin/htdocs/add_oclass_form.php:		if (get_request('meth','REQUEST') == 'ajax')
/usr/share/phpldapadmin/htdocs/add_value_form.php:$request['dn'] = get_request('dn','GET',true);
/usr/share/phpldapadmin/htdocs/add_value_form.php:$request['attr'] = get_request('attr','GET',true);
/usr/share/phpldapadmin/htdocs/add_value_form.php:$request['page'] = new TemplateRender($app['server']->getIndex(),get_request('template','REQUEST',false,null));
/usr/share/phpldapadmin/htdocs/add_value_form.php:if (! strcasecmp($request['attr'],'objectclass') || get_request('meth','REQUEST') != 'ajax') {
/usr/share/phpldapadmin/htdocs/cmd.php:$www['cmd'] = get_request('cmd','REQUEST');
/usr/share/phpldapadmin/htdocs/cmd.php:$www['meth'] = get_request('meth','REQUEST');
/usr/share/phpldapadmin/htdocs/cmd.php:	if ($app['server']->isReadOnly() && ! in_array(get_request('cmd','REQUEST'),$app['readwrite_cmds']))
/usr/share/phpldapadmin/htdocs/cmd.php:if (isAjaxEnabled() && get_request('refresh','REQUEST') && get_request('refresh','REQUEST') != get_request('frame','REQUEST')) {
/usr/share/phpldapadmin/htdocs/cmd.php:		get_request('refresh','REQUEST'),$app['server']->getIndex(),get_request('noheader','REQUEST',false,0),_('Auto refresh'));
/usr/share/phpldapadmin/htdocs/cmd.php:	$www['page']->show(get_request('frame','REQUEST',false,'BODY'),true,get_request('raw','REQUEST',false,false));
/usr/share/phpldapadmin/htdocs/collapse.php:$dn = get_request('dn','GET',true);
/usr/share/phpldapadmin/htdocs/compare.php:$request['dnSRC'] = get_request('dn_src');
/usr/share/phpldapadmin/htdocs/compare.php:$request['dnDST'] = get_request('dn_dst');
/usr/share/phpldapadmin/htdocs/compare.php:$ldap['SRC'] = $_SESSION[APPCONFIG]->getServer(get_request('server_id_src'));
/usr/share/phpldapadmin/htdocs/compare.php:$ldap['DST'] = $_SESSION[APPCONFIG]->getServer(get_request('server_id_dst'));
/usr/share/phpldapadmin/htdocs/compare.php:$request['pageSRC'] = new PageRender($ldap['SRC']->getIndex(),get_request('template','REQUEST',false,'none'));
/usr/share/phpldapadmin/htdocs/compare.php:$request['pageDST'] = new PageRender($ldap['DST']->getIndex(),get_request('template','REQUEST',false,'none'));
/usr/share/phpldapadmin/htdocs/compare_form.php:$request['dn'] = get_request('dn','GET');
/usr/share/phpldapadmin/htdocs/compare_form.php:$request['page'] = new PageRender($app['server']->getIndex(),get_request('template','REQUEST',false,'none'));
/usr/share/phpldapadmin/htdocs/copy.php:$request['dnSRC'] = get_request('dn_src');
/usr/share/phpldapadmin/htdocs/copy.php:$request['dnDST'] = get_request('dn_dst');
/usr/share/phpldapadmin/htdocs/copy.php:$ldap['SRC'] = $_SESSION[APPCONFIG]->getServer(get_request('server_id_src'));
/usr/share/phpldapadmin/htdocs/copy.php:$ldap['DST'] = $_SESSION[APPCONFIG]->getServer(get_request('server_id_dst'));
/usr/share/phpldapadmin/htdocs/copy.php:$request['recursive'] = (get_request('recursive') == 'on') ? true : false;
/usr/share/phpldapadmin/htdocs/copy.php:$request['remove'] = (get_request('remove') == 'yes') ? true : false;
/usr/share/phpldapadmin/htdocs/copy.php:	$filter = get_request('filter','POST',false,'(objectClass=*)');
/usr/share/phpldapadmin/htdocs/copy.php:		$request['pageSRC'] = new TemplateRender($ldap['SRC']->getIndex(),get_request('template','REQUEST',false,null));
/usr/share/phpldapadmin/htdocs/copy.php:		$request['pageDST'] = new TemplateRender($ldap['DST']->getIndex(),get_request('template','REQUEST',false,'none'));
/usr/share/phpldapadmin/htdocs/copy.php:	$request['pageSRC'] = new PageRender($serverSRC->getIndex(),get_request('template','REQUEST',false,'none'));
/usr/share/phpldapadmin/htdocs/copy.php:	$request['pageDST'] = new PageRender($serverDST->getIndex(),get_request('template','REQUEST',false,'none'));
/usr/share/phpldapadmin/htdocs/copy_form.php:$request['dn'] = get_request('dn','GET');
/usr/share/phpldapadmin/htdocs/copy_form.php:$request['page'] = new PageRender($app['server']->getIndex(),get_request('template','REQUEST',false,'none'));
/usr/share/phpldapadmin/htdocs/create.php:if (get_request('cancel','REQUEST')) {
/usr/share/phpldapadmin/htdocs/create.php:$request['redirect'] = get_request('redirect','POST',false,false);
/usr/share/phpldapadmin/htdocs/create.php:$request['page'] = new PageRender($app['server']->getIndex(),get_request('template','REQUEST',false,'none'));
/usr/share/phpldapadmin/htdocs/create.php:$request['page']->setContainer(get_request('container','REQUEST',true));
/usr/share/phpldapadmin/htdocs/create.php:if ((! $request['template']->getContainer() || ! $app['server']->dnExists($request['template']->getContainer())) && ! get_request('create_base'))
/usr/share/phpldapadmin/htdocs/create.php:if (! $request['container'] && ! get_request('create_base')) {
/usr/share/phpldapadmin/htdocs/create_confirm.php:$request['redirect'] = get_request('redirect','POST',false,false);
/usr/share/phpldapadmin/htdocs/create_confirm.php:$request['page'] = new PageRender($app['server']->getIndex(),get_request('template','REQUEST',false,'none'));
/usr/share/phpldapadmin/htdocs/create_confirm.php:$request['page']->setContainer(get_request('container','REQUEST',true));
/usr/share/phpldapadmin/htdocs/delete.php:$request['dn'] = get_request('dn','REQUEST',true);
/usr/share/phpldapadmin/htdocs/delete_attr.php:$request['dn'] = get_request('dn','REQUEST',true);
/usr/share/phpldapadmin/htdocs/delete_attr.php:$request['attr'] = get_request('attr','REQUEST',true);
/usr/share/phpldapadmin/htdocs/delete_attr.php:$request['index'] = get_request('index','REQUEST',true);
/usr/share/phpldapadmin/htdocs/delete_form.php:$request['dn'] = get_request('dn','GET');
/usr/share/phpldapadmin/htdocs/delete_form.php:$request['page'] = new PageRender($app['server']->getIndex(),get_request('template','REQUEST',false,'none'));
/usr/share/phpldapadmin/htdocs/download_binary_attr.php:$request['dn'] = get_request('dn','GET');
/usr/share/phpldapadmin/htdocs/download_binary_attr.php:$request['attr'] = strtolower(get_request('attr','GET',true));
/usr/share/phpldapadmin/htdocs/download_binary_attr.php:$request['index'] = get_request('index','GET',false,0);
/usr/share/phpldapadmin/htdocs/download_binary_attr.php:$request['type'] = get_request('type','GET',false,'octet-stream');
/usr/share/phpldapadmin/htdocs/download_binary_attr.php:$request['filename'] = get_request('filename','GET',false,sprintf('%s:%s.bin',get_rdn($request['dn'],true),$request['attr']));
/usr/share/phpldapadmin/htdocs/draw_tree_node.php:$request['dn'] = get_request('dn','REQUEST');
/usr/share/phpldapadmin/htdocs/draw_tree_node.php:$request['server_id'] = get_request('server_id','REQUEST');
/usr/share/phpldapadmin/htdocs/draw_tree_node.php:$request['code'] = get_request('code','REQUEST');
/usr/share/phpldapadmin/htdocs/draw_tree_node.php:$request['action'] = get_request('action','REQUEST');
/usr/share/phpldapadmin/htdocs/draw_tree_node.php:$request['noheader'] = get_request('noheader','REQUEST',false,0);
/usr/share/phpldapadmin/htdocs/entry_chooser.php:$request['container'] = get_request('container','GET');
/usr/share/phpldapadmin/htdocs/entry_chooser.php:$request['form'] = htmlspecialchars(addslashes(get_request('form','GET')));
/usr/share/phpldapadmin/htdocs/entry_chooser.php:$request['element'] = htmlspecialchars(addslashes(get_request('element','GET')));
/usr/share/phpldapadmin/htdocs/entry_chooser.php:$request['rdn'] = htmlspecialchars(addslashes(get_request('rdn','GET')));
/usr/share/phpldapadmin/htdocs/expand.php:$dn = get_request('dn','GET',true);
/usr/share/phpldapadmin/htdocs/export.php:$request['file'] = get_request('save_as_file') ? true : false;
/usr/share/phpldapadmin/htdocs/export.php:$request['exporter'] = new Exporter($app['server']->getIndex(),get_request('exporter_id','REQUEST'));
/usr/share/phpldapadmin/htdocs/export_form.php:$request['dn'] = get_request('dn','GET');
/usr/share/phpldapadmin/htdocs/export_form.php:$request['format'] = get_request('format','GET',false,get_line_end_format());
/usr/share/phpldapadmin/htdocs/export_form.php:$request['scope'] = get_request('scope','GET',false,'base');
/usr/share/phpldapadmin/htdocs/export_form.php:$request['exporter_id'] = get_request('exporter_id','GET',false,'LDIF');
/usr/share/phpldapadmin/htdocs/export_form.php:$request['filter'] = get_request('filter','GET',false,'(objectClass=*)');
/usr/share/phpldapadmin/htdocs/export_form.php:$request['attr'] = get_request('attributes','GET',false,'*');
/usr/share/phpldapadmin/htdocs/export_form.php:$request['sys_attr'] = get_request('sys_attr','GET') ? true: false;
/usr/share/phpldapadmin/htdocs/export_form.php:$request['page'] = new PageRender($app['server']->getIndex(),get_request('template','REQUEST',false,'none'));
/usr/share/phpldapadmin/htdocs/import.php:$request['continuous_mode'] = get_request('continuous_mode') ? true : false;
/usr/share/phpldapadmin/htdocs/import.php:$request['page'] = new PageRender($app['server']->getIndex(),get_request('template','REQUEST',false,'none'));
/usr/share/phpldapadmin/htdocs/import_form.php:$request['page'] = new PageRender($app['server']->getIndex(),get_request('template','REQUEST',false,'none'));
/usr/share/phpldapadmin/htdocs/index.php:if ($uri = get_request('URI','GET'))
/usr/share/phpldapadmin/htdocs/index.php:	$server = $_SESSION[APPCONFIG]->getServer(get_request('server_id','REQUEST'));
/usr/share/phpldapadmin/htdocs/login.php:$user['login'] = filter_var(get_request('login'),FILTER_SANITIZE_URL);
/usr/share/phpldapadmin/htdocs/login.php:$user['password'] = filter_var(get_request('login_pass'),FILTER_SANITIZE_URL);
/usr/share/phpldapadmin/htdocs/login.php:		sprintf('cmd.php?cmd=login_form&server_id=%s',get_request('server_id','REQUEST')));
/usr/share/phpldapadmin/htdocs/login.php:		sprintf('cmd.php?server_id=%s',get_request('server_id','REQUEST')));
/usr/share/phpldapadmin/htdocs/login.php:		sprintf('cmd.php?cmd=login_form&server_id=%s',get_request('server_id','REQUEST')));
/usr/share/phpldapadmin/htdocs/login_form.php:	if (get_request('redirect','GET',false,false))
/usr/share/phpldapadmin/htdocs/login_form.php:		printf('<input type="hidden" name="redirect" value="%s" />',rawurlencode(get_request('redirect','GET')));
/usr/share/phpldapadmin/htdocs/mass_delete.php:$request['dn'] = get_request('dn','REQUEST');
/usr/share/phpldapadmin/htdocs/mass_edit.php:$request['dn'] = get_request('dn','REQUEST');
/usr/share/phpldapadmin/htdocs/mass_edit.php:$request['attrs'] = get_request('attrs','REQUEST');
/usr/share/phpldapadmin/htdocs/mass_update.php:$request['dn'] = get_request('dn','REQUEST',true);
/usr/share/phpldapadmin/htdocs/mass_update.php:$request['mass_values'] = get_request('mass_values','REQUEST',true);
/usr/share/phpldapadmin/htdocs/mass_update.php:	if (get_request('confirm','REQUEST')) {
/usr/share/phpldapadmin/htdocs/modify_member_form.php:$request['dn'] = get_request('dn','GET');
/usr/share/phpldapadmin/htdocs/modify_member_form.php:$request['attr'] = get_request('attr','GET');
/usr/share/phpldapadmin/htdocs/modify_member_form.php:$request['page'] = new TemplateRender($app['server']->getIndex(),get_request('template','REQUEST',false,null));
/usr/share/phpldapadmin/htdocs/password_checker.php:$request['componentid'] = get_request('componentid','REQUEST');
/usr/share/phpldapadmin/htdocs/password_checker.php:$request['hash'] = get_request('hash','REQUEST');
/usr/share/phpldapadmin/htdocs/password_checker.php:$request['password'] = get_request('check_password','REQUEST');
/usr/share/phpldapadmin/htdocs/password_checker.php:$request['action'] = get_request('action','REQUEST');
/usr/share/phpldapadmin/htdocs/password_checker.php:$request['attribute'] = get_request('attr','REQUEST');
/usr/share/phpldapadmin/htdocs/password_checker.php:if (get_request('base64','REQUEST')) {
/usr/share/phpldapadmin/htdocs/purge_cache.php:	get_request('meth','REQUEST') == 'ajax' ? null : 'index.php');
/usr/share/phpldapadmin/htdocs/query_engine.php:$request['page'] = new QueryRender($app['server']->getIndex(),get_request('query','REQUEST',false,null));
/usr/share/phpldapadmin/htdocs/rdelete.php:$request['dn'] = get_request('dn','REQUEST',true);
/usr/share/phpldapadmin/htdocs/refresh.php:if (get_request('purge','REQUEST')) {
/usr/share/phpldapadmin/htdocs/refresh.php:if (get_request('meth','REQUEST') == 'ajax') 
/usr/share/phpldapadmin/htdocs/refresh.php:	header(sprintf('Location: cmd.php?cmd=draw_tree_node&noheader=%s&server_id=%s&meth=ajax&frame=TREE',get_request('noheader','REQUEST',false,0),$app['server']->getIndex()));
/usr/share/phpldapadmin/htdocs/rename.php:$request['dnSRC'] = get_request('dn','REQUEST');
/usr/share/phpldapadmin/htdocs/rename.php:$request['rdnDST'] = get_request('new_rdn','REQUEST');
/usr/share/phpldapadmin/htdocs/rename.php:		$app['server']->getIndex(),rawurlencode($request['dnDST']),get_request('template','REQUEST'));
/usr/share/phpldapadmin/htdocs/rename_form.php:$request['dn'] = get_request('dn','GET');
/usr/share/phpldapadmin/htdocs/rename_form.php:$request['template'] = get_request('template','GET');
/usr/share/phpldapadmin/htdocs/rename_form.php:$request['page'] = new PageRender($app['server']->getIndex(),get_request('template','REQUEST',false,'none'));
/usr/share/phpldapadmin/htdocs/schema.php:$entry['view'] = get_request('view','GET','false','objectclasses');
/usr/share/phpldapadmin/htdocs/schema.php:$entry['value'] = get_request('viewvalue','GET');
/usr/share/phpldapadmin/htdocs/schema.php:		$highlight_oid = get_request('highlight_oid','GET',false,false);
/usr/share/phpldapadmin/htdocs/show_cache.php:$request['key'] = get_request('key','REQUEST');
/usr/share/phpldapadmin/htdocs/show_cache.php:$request['index'] = get_request('index','REQUEST');
/usr/share/phpldapadmin/htdocs/show_cache.php:if (get_request('global','REQUEST'))
/usr/share/phpldapadmin/htdocs/show_cache.php:		<?php if (get_request('global','REQUEST')) { ?>
/usr/share/phpldapadmin/htdocs/template_engine.php:$request['dn'] = get_request('dn','REQUEST');
/usr/share/phpldapadmin/htdocs/template_engine.php:$request['page'] = new TemplateRender($app['server']->getIndex(),get_request('template','REQUEST',false,null));
/usr/share/phpldapadmin/htdocs/template_engine.php:	$request['page']->setContainer(get_request('container','REQUEST'));
/usr/share/phpldapadmin/htdocs/update.php:$request['dn'] = get_request('dn','REQUEST',true);
/usr/share/phpldapadmin/htdocs/update.php:if (get_request('cancel','REQUEST')) {
/usr/share/phpldapadmin/htdocs/update.php:$request['page'] = new PageRender($app['server']->getIndex(),get_request('template','REQUEST',false,'none'));
/usr/share/phpldapadmin/htdocs/update.php:	if (get_request('meth','REQUEST') == 'ajax')
/usr/share/phpldapadmin/htdocs/update_confirm.php:$request['dn'] = get_request('dn','REQUEST',true);
/usr/share/phpldapadmin/htdocs/update_confirm.php:$request['page'] = new PageRender($app['server']->getIndex(),get_request('template','REQUEST',false,'none'));
/usr/share/phpldapadmin/htdocs/view_jpeg_photo.php:$request['dn'] = get_request('dn','GET');
/usr/share/phpldapadmin/htdocs/view_jpeg_photo.php:$request['attr'] = strtolower(get_request('attr','GET',false,'jpegphoto'));
/usr/share/phpldapadmin/htdocs/view_jpeg_photo.php:$request['index'] = get_request('index','GET',false,0);
/usr/share/phpldapadmin/htdocs/view_jpeg_photo.php:$request['type'] = get_request('type','GET',false,'image/jpeg');
/usr/share/phpldapadmin/htdocs/view_jpeg_photo.php:$request['filename'] = get_request('filename','GET',false,sprintf('%s.jpg',get_rdn($request['dn'],true)));
/usr/share/phpldapadmin/htdocs/view_jpeg_photo.php:$request['location'] = get_request('location','GET',false,'ldap');
