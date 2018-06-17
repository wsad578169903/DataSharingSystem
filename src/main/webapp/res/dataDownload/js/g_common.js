/**
 * Created by Administrator on 2017/10/16.
 */


// 全选效果
function selectAll(el1,el2){
    el1.on('click',function(){
        if(el2.find('.fuxuan').is(':checked')){
            el2.find('.fuxuan').removeAttr("checked");
        }else {
            el2.find('.fuxuan').prop("checked",true);
        }

    })
}


selectAll($('.qx1'),$('.qx11'));
selectAll($('.qx2'),$('.qx22'));
selectAll($('.qx3'),$('.qx33'));
selectAll($('.qx4'),$('.qx44'));

//选择加背景

function selectBg(el) {
    el.find('span').on('click',function () {

        $(this).addClass('active');
        $(this).siblings().removeClass('active');
    });
}



selectBg($('.zdselect'));

selectBg($('.zdselect1'));


//让所有的checkbox的id等于for的id


// // 给checkbox添加 checkbox+index
// $('input:checkbox').each(function () {
//     alert($('input:checkbox').index());
// });