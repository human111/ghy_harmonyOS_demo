import formInfo from '@ohos.app.form.formInfo';
import formBindingData from '@ohos.app.form.formBindingData';
import FormExtensionAbility from '@ohos.app.form.FormExtensionAbility';
import formProvider from '@ohos.app.form.formProvider';

/*
 * FormExtensionAbility进程不能常驻后台，即在卡片生命周期回调函数中无法处理长时间的任务，在生命周期调度完成后会继续存在5秒，
 * 如5秒内没有新的生命周期回调触发则进程自动退出。针对可能需要5秒以上才能完成的业务逻辑，建议拉起主应用进行处理，
 * 处理完成后使用updateForm通知卡片进行刷新。
 * */

export default class TestEntryFormAbility extends FormExtensionAbility {
  onAddForm(want) {
    console.info('[EntryFormAbility] onAddForm');
    // 在入参want中可以取出卡片的唯一标识：formId
    let formId: string = want.parameters[formInfo.FormParam.IDENTITY_KEY];
    // 使用方创建卡片时触发，提供方需要返回卡片数据绑定类
    let obj = {
      'title': 'titleOnAddForm',
      'detail': 'detailOnAddForm'
    };

    // Called to return a FormBindingData object.
    let formData = {};
    return formBindingData.createFormBindingData(formData);
  }

  onCastToNormalForm(formId) {
    // Called when the form provider is notified that a temporary form is successfully
    // converted to a normal form.
  }

  onUpdateForm(formId) {
    // Called to notify the form provider to update a specified form.
    // 若卡片支持定时更新/定点更新/卡片使用方主动请求更新功能，则提供方需要重写该方法以支持数据更新
    console.info('[EntryFormAbility] onUpdateForm');
    let obj = {
      'title': 'titleOnUpdateForm',
      'detail': 'detailOnUpdateForm'
    };
    let formData = formBindingData.createFormBindingData(obj);
    formProvider.updateForm(formId, formData).catch((err) => {
      if (err) {
        // 异常分支打印
        console.error(`[EntryFormAbility] Failed to updateForm. Code: ${err.code}, message: ${err.message}`);
        return;
      }
    });
  }

  onChangeFormVisibility(newStatus) {
    // 需要配置formVisibleNotify为true，且为系统应用才会回调
    // Called when the form provider receives form events from the system.
  }

  onFormEvent(formId, message) {
    // 若卡片支持触发事件，则需要重写该方法并实现对事件的触发
    // Called when a specified message event defined by the form provider is triggered.
  }

  onRemoveForm(formId) {
    // 当对应的卡片删除时触发的回调，入参是被删除的卡片ID
    // Called to notify the form provider that a specified form has been destroyed.
  }

  onConfigurationUpdate(config) {
    // 当系统配置信息置更新时触发的回调
    console.info('[EntryFormAbility] configurationUpdate:' + JSON.stringify(config));
  }

  onAcquireFormState(want) {
    // 卡片提供方接收查询卡片状态通知接口，默认返回卡片初始状态。
    // Called to return a {@link FormState} object.
    return formInfo.FormState.READY;
  }
};