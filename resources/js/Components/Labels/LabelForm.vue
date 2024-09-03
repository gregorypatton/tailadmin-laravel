<template>
  <div>
    <form @submit.prevent="submitForm">
      <div v-for="(product, index) in form.products" :key="index" class="product-group">
        <label :for="'product_' + index">Product ID</label>
        <input
          type="text"
          :id="'product_' + index"
          v-model="product.sku"
          placeholder="Enter product ID"
        />
        <label :for="'count_' + index">Count</label>
        <input
          type="number"
          :id="'count_' + index"
          v-model="product.count"
          placeholder="Enter count"
          min="1"
        />
        <t-button type="button" @click.native="removeProduct(index)">Remove</t-button>
        <span v-if="errors['products.' + index + '.sku']" class="error">{{ errors['products.' + index + '.sku'] }}</span>
        <span v-if="errors['products.' + index + '.count']" class="error">{{ errors['products.' + index + '.count'] }}</span>
      </div>

      <t-button type="button" @click.native="addProduct">Add Another Product</t-button>

      <div>
        <label for="template">Label Template</label>
        <select id="template" v-model="form.template">
          <option value="default">Default Template</option>
          <option value="custom">Custom Template</option>
        </select>
        <span v-if="errors.template" class="error">{{ errors.template }}</span>
      </div>

      <t-button type="submit">Generate Labels</t-button>
    </form>

    <div v-if="htmlContent">
      <iframe ref="labelIframe" :srcdoc="htmlContent" style="width: 100%; height: 600px; border: 1px solid #ccc;"></iframe>
      <t-button @click="printIframe">Print Labels</t-button>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import TButton from "@/Components/Button/TButton.vue";
import { useForm } from '@inertiajs/vue3';
import axios from 'axios';

const form = useForm({
  products: [{ sku: '', count: 1 }],
  template: 'default',
});

const errors = ref({});
const htmlContent = ref(null);

function addProduct() {
  form.products.push({ sku: '', count: 1 });
}

function removeProduct(index) {
  form.products.splice(index, 1);
}
async function submitForm() {
  form.post('/label/generate', {
    onError: (errorBag) => {
      errors.value = errorBag;
    },
    onSuccess: async () => {
      try {
        const response = await axios.get('/label/render');
        htmlContent.value = response.data;
      } catch (error) {
        console.error('Error generating labels:', error);
      }
    },
  });
}

function printIframe() {
  const iframe = document.querySelector('iframe');
  iframe.contentWindow.focus();
  iframe.contentWindow.print();
}
</script>

<style scoped>
.product-group {
  margin-bottom: 15px;
}
.error {
  color: red;
  font-size: 0.875em;
}
</style>
