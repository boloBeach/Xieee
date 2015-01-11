/**
 * Created by Administrator on 2014/12/30.
 */
;(function(window, $) {
    $(function() {
        var type = $('.login-type');
        type.children('li').on('click', function() {
            var _this = $(this);
            if(!_this.hasClass('on')) {
                type.children('li').removeClass('on');
                _this.addClass('on');
            }

            if(_this.attr('data-type') == 'own') {
                $('.own').show();
                $('.other').hide();
            } else {
                $('.own').hide();
                $('.other').show();
            }
        });
        $('.other').hide();
    });
})(window, jQuery);