{{--
    分页组件
    @param category_id pagination
--}}

@verbatim
    <div id="pagination" class="pages cleafix" style="text-align: center">
        <page
                prev-text="上一页"
                next-text="下一页"
               :current="pagination.current"
                :total="pagination.total"
                :page-size="pagination.pageSize"
                @on-change="change"
        />
    </div>
@endverbatim

<script>
    (function () {
        new Vue({
            el: '#pagination',
            data: {
                pagination: @json($pagination),
                category_id:{{$category_id}},
            },
            methods: {
                change(page) {
                    window.location.href = "/index/category/" + this.category_id + "?current_page=" + page;
                }
            },
            created() {
                // console.log(this.pagination, this.category_id);
            }
        })
    })();
</script>


<style>
    .ivu-page-prev a i {
        margin-top: 7px;
    }

    .ivu-page-next a i {
        margin-top: 7px;
    }

</style>
