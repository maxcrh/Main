import { LightningElement, track } from 'lwc';

const columns = [
    { label: 'Nome', fieldName: 'name', type: 'text' },
    { label: 'CPF', fieldName: 'cpf', type: 'text' },
    { label: 'Dólar', fieldName: 'dolar', type: 'currency' },
    { label: 'Euro', fieldName: 'euro', type: 'currency' },
    { label: 'Cadastro', fieldName: 'cadastro', type: 'text' },
    { label: 'KYC', fieldName: 'kyc', type: 'text' },
    { label: 'Limite', fieldName: 'limite', type: 'text' },
];

const data = [{
                name: 'Max',
                cpf: '22637175877',
                dolar: 100000,
                euro: 25000,
                cadastro: 'verde',
                kyc: 'verde',
                limite: 'verde'
            },
            {
                name: 'Batman',
                cpf: '74185296302',
                dolar: 15000000,
                euro: 15000000,
                cadastro: 'verde',
                kyc: 'verde',
                limite: 'verde'
            },
            {
                name: 'Superman',
                cpf: '98765431202',
                dolar: 100000,
                euro: 25000,
                cadastro: 'vermelho',
                kyc: 'verde',
                limite: 'verde'
            },
            {
                name: 'Murillo',
                cpf: '12345678901',
                dolar: 200000,
                euro: 100000,
                cadastro: 'verde',
                kyc: 'verde',
                limite: 'verde'
            },
            {
                name: 'Talita',
                cpf: '00011122233',
                dolar: 150000,
                euro: 75000,
                cadastro: 'verde',
                kyc: 'verde',
                limite: 'vermelho'
            }];


export default class FiltroOrdem extends LightningElement {
    data=data;

    @track data2=data;
    columns = columns;

    @track valueSort;
    @track valueFiltro;

    get options_ordem() {
        return [
            { label: 'Dolar', value: 'US' },
            { label: 'Euro', value: 'EUR' },
        ];
    }

    get options_filtro() {
        return [
            { label: 'Habilitação completa', value: 'HC' },
            { label: 'Habilitação incompleta', value: 'HI' },
            { label: 'TODOS', value: 'AllH' },
        ];
    }

    handleSort(event) {
        this.value = event.detail.value;
        
        if(this.value == 'US'){
            alert(this.value);
        }else{
            alert(this.value);
        }
    }

    handleChange(event) {
        this.value = event.detail.value;

        var myObj = data;
        var i;
        this.data2 = [];
        
        if(this.value == 'HC'){
            for(i in myObj) {
                if(myObj[i].cadastro == 'verde' && myObj[i].kyc == 'verde' && myObj[i].limite == 'verde'){
                    this.data2.push(myObj[i]);
                }
            }
        } else if (this.value == 'HI'){
            for(i in myObj) {
                if(myObj[i].cadastro != 'verde' || myObj[i].kyc != 'verde' || myObj[i].limite != 'verde'){
                    this.data2.push(myObj[i]);
                }
            }
        } else {
            this.data2 = data;
        }
    }
}