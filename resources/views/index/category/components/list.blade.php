{{--
    文章列表组件
    @param posts
--}}

@verbatim
    <ul class="ul_list" id="post_list">
        <template v-for="(li,index) in chunks_li">
            <li :class="{ marr: index=== chunks_li.length-1}">
                <a v-for="row in li" :href="getUrl(row.id)">
                    <span>{{row.published_at_format}}</span>
                    {{row.post_title}}
                </a>
            </li>
        </template>
    </ul>
@endverbatim

<script>
    (function () {
        new Vue({
            el: '#post_list',
            data: {
                rows: @json($posts),
            },
            computed: {
                chunks_li: function () {
                    let result = [];
                    let count = 0;
                    for (let i = 0; i < this.rows.length; i++) {
                        if (!result.hasOwnProperty(count)) {
                            result[count] = [];
                        }
                        result[count].push(this.rows[i]);

                        if ((i + 1) % 5 === 0) {
                            count++
                        }
                    }
                    return result;
                }
            },
            methods: {
                getUrl(postId) {
                    return "/index/post/" + postId;
                }
            },
            created() {
                console.log(this.rows);
            }
        })
    })();
</script>
