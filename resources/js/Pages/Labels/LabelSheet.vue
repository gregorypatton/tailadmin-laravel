<template>
<style lang="scss" scoped>
@import "Styles/label-30up/main";
@import url('https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@100;400;700&display=swap');

</style>
  <div>
    <div v-for="(page, pageIndex) in pages" :key="pageIndex" class="page">
      <Label
        v-for="(label, index) in page.labels"
        :key="index"
        :product="label.product"
        :labelPosition="index"
        :separator="label.separator"
      />
      <BlankLabel v-if="page.blankCount > 0" v-for="i in page.blankCount" :key="i" />
    </div>
  </div>
</template>

<script setup>
import { defineProps } from 'vue';
import Label from './Label.vue';
import BlankLabel from './BlankLabel.vue';

const props = defineProps({
  pages: Array,
});
</script>
