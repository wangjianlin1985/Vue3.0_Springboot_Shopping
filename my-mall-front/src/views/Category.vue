<template>
  <div class="categray">
    <div>
      <header class="category-header wrap van-hairline--bottom">
        <i class="nbicon nbfanhui" @click="goHome"></i>
        <div class="header-search">
          <i class="nbicon nbSearch"></i>
          <router-link tag="span" class="search-title" to="./product-list?from=category">搜索心仪的商品</router-link>
        </div>
        <i class="iconfont icon-More"></i>
      </header>
      <nav-bar></nav-bar>
      <div class="search-wrap" ref="searchWrap">
        <list-scroll :scroll-data="categoryData" class="nav-side-wrapper">
          <ul class="nav-side">
            <li
              v-for="item in categoryData"
              :key="item.categoryId"
              v-text="item.categoryName"
              :class="{'active' : currentIndex == item.categoryId}"
              @click="selectMenu(item.categoryId)"
            ></li>
          </ul>
        </list-scroll>
        <div class="search-content">
          <list-scroll :scroll-data="categoryData" >
            <div class="swiper-container">
              <div class="swiper-wrapper">
                <template v-for="(category, index) in categoryData">
                  <div class="swiper-slide" v-if="currentIndex == category.categoryId" :key="index">
                    <!-- <img class="category-main-img" :src="category.mainImgUrl" v-if="category.mainImgUrl"/> -->
                    <div class="category-list" v-for="(products, index) in category.secondLevelCategoryVOS" :key="index">
                      <p class="catogory-title">{{products.categoryName}}</p>
                      <div class="product-item" v-for="(product, index) in products.thirdLevelCategoryVOS" :key="index" @click="selectProduct(product)">
                        <img src="@/common/img/分类.png" class="product-img"/>
                        <p v-text="product.categoryName" class="product-title"></p>
                      </div>
                    </div>
                  </div>
                </template>
              </div>
            </div>
          </list-scroll>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { reactive, onMounted, ref, toRefs } from 'vue'
import { useRouter } from 'vue-router'
import navBar from '@/components/NavBar'
import listScroll from '@/components/ListScroll'
import { getCategory } from "@/service/good";
import { Toast } from 'vant'
export default {
  components: {
    navBar,
    listScroll
  },
  setup() {
    const router = useRouter()
    // composition API 获取 refs 的形式
    const searchWrap = ref(null)
    const state = reactive({
      categoryData: [],
      currentIndex: 15
    })

    onMounted(async () => {
      let $screenHeight = document.documentElement.clientHeight
      console.log('searchWrap.value', searchWrap.value)
      searchWrap.value.style.height = $screenHeight - 100 + 'px'
      Toast.loading('加载中...')
      const { data } = await getCategory()
      Toast.clear()
      state.categoryData = data
    })

    const goHome = () => {
      router.push({ path: 'home' })
    }

    const selectMenu = (index) => {
      state.currentIndex = index
    }

    const selectProduct = (item) => {
      console.log('item', item.categoryId)
      router.push({ path: '/product-list', query: { categoryId: item.categoryId } })
    }
    return {
      ...toRefs(state),
      goHome,
      selectMenu,
      selectProduct,
      searchWrap
    }
  }
}
</script>
<style lang="less" scoped>
  @import '../common/style/mixin';
  .categray {
    .category-header {
      background: #fff;
      position: fixed;
      left: 0;
      top: 0;
      .fj();
      .wh(100%, 50px);
      line-height: 50px;
      padding: 0 15px;
      box-sizing: border-box;
      font-size: 15px;
      color: #656771;
      z-index: 10000;
      &.active {
        background: @primary;
      }
      .icon-left {
        font-size: 25px;
        font-weight: bold;
      }
      .header-search {
        display: flex;
        width: 80%;
        height: 20px;
        line-height: 20px;
        margin: 10px 0;
        padding: 5px 0;
        color: #232326;
        background: #F7F7F7;
        border-radius: 20px;
        .nbSearch {
          padding: 0 10px 0 20px;
          font-size: 17px;
        }
        .search-title {
          font-size: 12px;
          color: #666;
          line-height: 21px;
        }
      }
      .icon-More {
        font-size: 20px;
      }
    }
  }
  .search-wrap {
    .fj();
    width: 100%;
    margin-top: 50px;
    background: #F8F8F8;
    .nav-side-wrapper {
      width: 28%;
      height: 100%;
      overflow: hidden;
      .nav-side {
        width: 100%;
        .boxSizing();
        background: #F8F8F8;
        li {
          width: 100%;
          height: 56px;
          text-align: center;
          line-height: 56px;
          font-size: 14px;
          &.active {
            color: @primary;
            background: #fff;
          }
        }
      }
    }
    .search-content {
      width: 72%;
      height: 100%;
      padding: 0 10px;
      background: #fff;
      overflow-y: scroll;
      touch-action: pan-y;
      * {
          touch-action: pan-y;
        }
      .boxSizing();
      .swiper-container {
        width: 100%;
        .swiper-slide {
          width: 100%;
          .category-main-img {
            width: 100%;
          }
          .category-list {
            display: flex;
            flex-wrap: wrap;
            flex-shrink: 0;
            width: 100%;
            .catogory-title {
              width: 100%;
              font-size: 17px;
              font-weight: 500;
              padding: 20px 0;
            }
            .product-item {
              width: 33.3333%;
              margin-bottom: 10px;
              text-align: center;
              font-size: 15px;
              .product-img {
                .wh(30px, 30px);
              }
            }
          }
        }
      }
    }
  }
  .fade-out-enter-active, .fade-out-leave-active {
    // transition: opacity 0.5s;
  }

  .fade-out-enter, .fade-out-leave-to {
    // opacity: 0;
  }
</style>