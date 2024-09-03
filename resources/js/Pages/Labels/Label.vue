<template>
  <div class="label">
    <div v-if="labelPosition === 0 && product.hide_upc" class="instructions">HIDE UPC</div>
    <div v-if="product.kit" class="kit">KIT</div>
    <h1>{{ product.sku }}</h1>
    <div class="f_right">
      <div v-if="separator" class="fnsku">PRODUCT INSTRUCTIONS PRODUCT INSTRUCTIONS PRODUCT INSTRUCTIONS PRODUCT</div>
      <div v-else>
        <img :src="barcode" id="barcode" />
        <div class="fnsku">{{ product.id_type === 'UPC' ? product.id : product.fnsku }}</div>
        <div class="title">{{ truncatedDesc }}</div>
        <div class="bottom">
          <div v-if="product.id_type !== 'UPC'" class="condition">New</div>
          <div class="tm">
            Sold by <span class="doner">{{ product.brand === 'ResOne' ? 'Manufactured for ResOne' : 'Doner Medical' }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    product: Object,
    labelPosition: Number,
    separator: Boolean,
  },
  computed: {
    truncatedDesc() {
      return this.product.title.length > 75
        ? this.product.title.slice(0, 75) + '...'
        : this.product.title;
    },
    barcode() {
      return `data:image/png;base64, ${this.product.id_type === 'UPC' ? this.product.id : this.product.fnsku}`;
    },
  },
};
</script>
