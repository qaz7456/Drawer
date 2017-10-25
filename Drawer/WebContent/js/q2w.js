$(document).ready(function() {
	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
		$.fn.dataTable.tables({
			visible : true,
			api : true
		}).columns.adjust();
	});

//	$('table.table').DataTable({
//		ajax : 'arrays.txt',
//		scrollY : 200,
//		scrollCollapse : true,
//		paging : false
//	});
	.DataTable({
		dom : "Blfr<t>ip",
	    scrollY: "290px",
		width : 'auto',
		lengthChange: false,
		scrollCollapse : true,
		destroy : true,
//		language : {
//			"url" : "js/dataTables_zh-tw.txt",
//			"emptyTable" : "查無資料",
//		},
		initComplete: function(settings, json) {
	        $('div .dt-buttons').css({
	            'float': 'left',
	            'margin-left': '10px'
	        });
	        $('div .dt-buttons a').css('margin-left', '10px');
	    },
//		ajax : {
//			url : "stockMod.do",
//			dataSrc : "",
//			type : "POST",
//			data : parameter
//		},
		columns : [ {
			"title" : "勾選",
			"data" : null,
			"defaultContent" : ""
		},{
			"title" : "來源欄位",
			"data" : "source",
			"defaultContent" : ""
		}, {
			"title" : "目標欄位",
			"data" : "destination",
			"defaultContent" : ""
		}
		, {
			"title" : "描述",
			"data" : "description",
			"defaultContent" : ""
		}, {
			"title" : "是否為屬性",
			"data" : "isAttribute",
			"defaultContent" : ""
		}, {
			"title" : "功能",
			"data" : null,
			"defaultContent" : ""
		} ],
		columnDefs : [ {
			targets : 0,
			searchable : false,
			orderable : false,
			render : function(data, type, row) {
				var stockmod_id = row.stockmod_id;

				var input = document.createElement("INPUT");
				input.type = 'checkbox';
				input.name = 'checkbox-group-select';
				input.id = stockmod_id;
				
				var span = document.createElement("SPAN");
				span.className = 'form-label';

				var label = document.createElement("LABEL");
				label.htmlFor = row.stockmod_id;
				label.name = 'checkbox-group-select';
				label.style.marginLeft = '40%';
				label.appendChild(span);

				var options = $("<div/>").append(input, label);

				return options.html();
			}
		}, {
			//功能
			targets : -1,
			searchable : false,
			orderable : false,
			render : function(data, type, row) {

				var options = $("<div/>").append($("<div/>", {
					"class" : "table-row-func btn-in-table btn-gray"
				}).append($("<i/>", {
					"class" : "fa fa-ellipsis-h"
				})).append($("<div/>", {
					"class" : "table-function-list"
				}).append($("<button/>", {
					"class" : "btn-in-table btn-darkblue btn_update",
					"title" : "修改"
				}).append($("<i/>", {
					"class" : "fa fa-pencil"
				}))).append($("<button/>", {
					"class": "btn-in-table btn-green btn_list",
					"title": "清單"
				}).append( $("<i/>", {
					"class": "fa fa-pencil-square-o"
				}))).append($("<button/>", {
					"class" : "btn-in-table btn-alert btn_delete",
					"title" : "刪除",
					"name" : row.stockmod_id
				}).append($("<i/>", {
					"class" : "fa fa-trash"
				})))));

				return options.html();
			}
		} ],
		buttons : [ {
			text : '全選',
			action : function(e, dt, node, config) {

				selectCount++;
				console.log('selectCount: '+ selectCount);
				var $dtMaster =  $('#stockmod-master-table');
				var $checkboxs = $dtMaster.find('input[name=checkbox-group-select]');

				console.log('selectCount % 2 : ' + selectCount % 2);
				
				
				selectCount %2 != 1 ?
						$checkboxs.each(function() {
							$(this).prop("checked", false);
							$(this).removeClass("toggleon");
						}): 
						$checkboxs.each(function() {
							$(this).prop("checked", true);
							$(this).addClass("toggleon");
						});						
			}
		}, {
			text : '批次刪除',
			action : function(e, dt, node, config) {
				var $dtMaster =  $('#stockmod-master-table');
				var delArr = '';
				
				var $checkboxs = $dtMaster.find('input[name=checkbox-group-select]:checked');
				
				console.log($checkboxs);
				
				if($checkboxs.length == 0){
					alert('請至少選擇一筆資料');
					return false;
				}
				
				var dialogId = "dialog-data-process";
				var formId = "dialog-form-data-process";
				var btnTxt_1 = "批次刪除";
				var btnTxt_2 = "取消";
				var oWidth = 'auto';
				var url = 'stockMod.do';
				
				$checkboxs.each(function() {
					delArr += this.id + ',';
				});
				
				delArr = delArr.slice(0,-1);
				
				console.log("delArr:"+delArr);
				
				initDeleteDialog();
				drawDialog
					(dialogId, url, oWidth, formId, btnTxt_1, btnTxt_2)
					.data("stockmodId",delArr)
					.dialog("option","title","刪除"+ $checkboxs.length +"筆資料")
					.dialog("open");					
			}
		}, {
			text : '新增儲位異動',
			action : function(e, dt, node, config) {
				var dialogId = "dialog-data-process";
				var formId = "dialog-form-data-process";
				var btnTxt_1 = "新增儲位異動";
				var btnTxt_2 = "取消";
				var oWidth = 'auto';
				var oUrl = 'stockMod.do';

				initDialog();
				drawDialog(dialogId, oUrl, oWidth, formId, btnTxt_1, btnTxt_2)
					.dialog("option","title",btnTxt_1)
					.dialog('open');
			}
		} ]
	});
};
	// Apply a search to the second table for the demo
	$('#xmlConverterTable').DataTable().search('New York').draw();
});