/**
 * Created by Administrator on 2014/12/30.
 */
;(function(window, $) {
    $(function() {

        //搜索
        var search = $('#search');
        search.on('keydown', function(event) {
            if(event.keyCode == 13) {
                var val = search.val();
                if(val != null && val != '') {
                    doSearch(val);
                }
            }
        }).on('blur', function() {
            search.val('');
        });

        search.next('i').on('click', function() {
            var val = search.val();
            if(val != null && val != '') {
                doSearch(val);
            }
        });
        /**
         * 执行搜索
         * @param val 搜索关键词
         */
        function doSearch(val) {
            alert('doSearch: ' + val);
        }


        //排序
        var sort = $('#sort');
        sort.children('li').on('click', function() {
            var _this = $(this);

            if(!_this.hasClass('on')) {
                sort.children('li').removeClass('on');
                _this.addClass('on');
            }

            doSort(_this.attr('data-sort'));
        });
        /**
         * 执行排序
         * @param type 排序类型
         * time 按时间排序
         * heat 按热度排序
         */
        function doSort(type) {
            alert('doSort: ' + type);
        }


        var content = $('.index-content-left-item'), imageShow = $('.image-show');
        content.find('img').on('click', function() {
            var _this = $(this);
            imageShow.show();
            imageShow.find('img').attr('style', '').attr('src', _this.attr('src')).animate({
                width: _this.width(),
                height: _this.height(),
                opacity: 1
            })
        });
        imageShow.find('i').on('click', function() {
            imageShow.hide();
        });
    });
})(window, jQuery);