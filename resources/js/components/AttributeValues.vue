<template>
    <div id="">
        <div class="tile">
            <h3 class="tile-title">Attribute Values</h3>
            <hr>
            <div class="tile-body">
                <div class="form-group">
                    <label class="control-label" for="value">Value</label>
                    <input
                            class="form-control"
                            type="text"
                            placeholder="Enter attribute value"
                            id="value"
                            name="value"
                            v-model="value"
                    />
                </div>
                <div class="form-group">
                    <label class="control-label" for="price">Price</label>
                    <input
                            class="form-control"
                            type="number"
                            placeholder="Enter attribute value price"
                            id="price"
                            name="price"
                            v-model="price"
                    />
                </div>
            </div>
            <div class="tile-footer">
                <div class="row d-print-none mt-2">
                    <div class="col-12 text-right">
                        <button class="btn btn-success" type="submit" @click.stop="saveValue()" v-if="addValue">
                            <i class="fa fa-fw fa-lg fa-check-circle"></i>Save
                        </button>
                        <button class="btn btn-success" type="submit" @click.stop="updateValue()" v-if="!addValue">
                            <i class="fa fa-fw fa-lg fa-check-circle"></i>Update
                        </button>
                        <button class="btn btn-primary" type="submit" @click.stop="reset()" v-if="!addValue">
                            <i class="fa fa-fw fa-lg fa-check-circle"></i>Reset
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="tile">
            <h3 class="tile-title">Option Values</h3>
            <div class="tile-body">
                <div class="table-responsive">
                    <table class="table table-sm">
                        <thead>
                        <tr class="text-center">
                            <th>#</th>
                            <th>Value</th>
                            <th>Price</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="value in values">
                            <td style="width: 25%" class="text-center">{{ value.id}}</td>
                            <td style="width: 25%" class="text-center">{{ value.value}}</td>
                            <td style="width: 25%" class="text-center">{{ value.price}}</td>
                            <td style="width: 25%" class="text-center">
                                <button class="btn btn-sm btn-primary" @click.stop="editAttributeValue(value)">
                                    <i class="fa fa-edit"></i>
                                </button>
                                <button class="btn btn-sm btn-danger" @click.stop="deleteAttributeValue(value)">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: ['attributeid'],
        data() {
            return {
                values: [],
                value: '',
                price: '',
                currentId: '',
                addValue: true,
                key: 0,
            }
        },
        created: function() {
            this.loadValues();
        },
        methods: {
            loadValues() {
                axios.post('/admin/attributes/get-values', {
                    id: this.attributeid
                }).then (response => this.values = response.data)
                    .catch(error => console.log(error));
            },
            saveValue() {
                if (this.value === '') {
                    this.$swal("Error, Value for attribute is required.", {
                        icon: "error",
                    });
                } else {
                    axios.post('/admin/attributes/add-values', {
                        id: this.attributeid,
                        value: this.value,
                        price: this.price,
                    }).then (response => {
                        this.values.push(response.data);
                        this.resetValue();
                        this.$swal("Success! Value added successfully!", {
                            icon: "success",
                        });
                    }).catch(error => console.log(error));
                }
            },
            editAttributeValue(value) {
                this.addValue = false;
                this.value = value.value;
                this.price = value.price;
                this.currentId = value.id;
                this.key = this.values.indexOf(value);
            },
            updateValue() {
                if (this.value === '') {
                    this.$swal("Error, Value for attribute is required.", {
                        icon: "error",
                    });
                } else {
                    axios.post('/admin/attributes/update-values', {
                        id: this.attributeid,
                        value: this.value,
                        price: this.price,
                        valueId: this.currentId
                    }).then (response => {
                        this.values.splice(this.key, 1);
                        this.resetValue();
                        this.values.push(response.data);
                        this.$swal("Success! Value updated successfully!", {
                            icon: "success",
                        });
                    }).catch(error => console.log(error));
                }
            },
            deleteAttributeValue(value) {
                this.$swal({
                    title: "Are you sure?",
                    text: "Once deleted, you will not be able to recover this attribute value!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                }).then((willDelete) => {
                    if (willDelete) {
                        this.currentId = value.id;
                        this.key = this.values.indexOf(value);
                        axios.post('/admin/attributes/delete-values', {
                            id: this.currentId
                        }).then (response => {
                            if (response.data.status === 'success') {
                                this.values.splice(this.key, 1);
                                this.resetValue();
                                this.$swal("Success! Attribute value has been deleted!", {
                                    icon: "success",
                                });
                            } else {
                                this.$swal("Your attribute value not deleted!");
                            }
                        }).catch(error => console.log(error));
                    } else {
                        this.$swal("Your option value not deleted!");
                    }
                });
            },
            resetValue() {
                this.value = '';
                this.price = '';
            },
            reset() {
                this.addValue = true;
                this.resetValue();
            }
        }
    }
</script>