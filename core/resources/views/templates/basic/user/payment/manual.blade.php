@extends($activeTemplate . 'layouts.app')

@section('panel')
    <div class="row justify-content-center gy-4">
        <div class="col-lg-8">
            <div class="card b-radius--10">
                <div class="card-body  p-4 ">
                    <form action="{{ route('user.deposit.manual.update') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <p class="text-center mt-2">@lang('Vous avez demandé') <b
                                        class="text--success">{{ showAmount($data['amount']) }}
                                        {{ __($general->cur_text) }}</b>, @lang('veuillez payez')
                                    <b class="text--success">{{ showAmount($data['final_amo']) . ' ' . $data['method_currency'] }}
                                    </b> @lang('pour valider la transaction')
                                </p>
                                <h4 class="text-center mb-4">@lang('Veuillez suivre les instructions ci-dessous')</h4>
                                <p class="text-center mb-4">@lang('Effectuer Votre dépôt au Numéro Suivant : <br><strong>MTN MoMo 652796305</strong> ou <strong>OM 697946206</strong> <br>Bénéficiaire: <strong>TCHEDJE MBOUGEMG Alain</strong> [CEO FollowMeToo]') <br>Remplissez ensuite les champs suivants après votre dépôt. <span style="color: #004e92; font-weight: 800;">Patientez 5 minutes pour sa confirmation.</span></p>
                                

                            </div>

                            <x-viser-form identifier="id" identifierValue="{{ $gateway->form_id }}" />

                            <div class="col-md-12">
                                <div class="form-group">
                                    <button type="submit" class="btn btn--primary w-100 h-45">@lang('Payez Maintenant')</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
@endsection
