import React, { useState } from 'react';
import { Pressable, Text, TextInput, View } from 'react-native';
import { IconOutline } from '@ant-design/icons-react-native';
import { styles } from '../../styles';
import type { LoginFormState, LoginTransportMode, SdkStatus } from '../../types';
import { connectionText } from '../../utils';

const transportOptions: Array<{ mode: LoginTransportMode; label: string; detail: string }> = [
  { mode: 'websocket', label: 'WebSocket', detail: '按填写的 ws:// 或 wss:// 地址连接' },
  { mode: 'quic', label: 'QUIC', detail: '使用 native QUIC transport 直连' },
  { mode: 'race', label: '竞速', detail: 'QUIC 与 WebSocket 按顺序竞速' },
];

const gridLines = [0, 1, 2, 3, 4, 5];

export function LoginScreen(props: {
  form: LoginFormState;
  sdkStatus: SdkStatus;
  sdkMessage: string;
  loading: boolean;
  onChange: (patch: Partial<LoginFormState>) => void;
  onLogin: () => void;
}) {
  const [transportOpen, setTransportOpen] = useState(false);
  const [serverOpen, setServerOpen] = useState(false);
  const selectedTransport = transportOptions.find((item) => item.mode === props.form.transportMode) ?? transportOptions[0];
  const canLogin = Boolean(props.form.userId.trim()) && !props.loading;

  return (
    <View style={styles.loginScreen}>
      <View style={styles.loginHeroPanel}>
        <View pointerEvents="none" style={styles.loginGridLayer}>
          {gridLines.map((line) => (
            <React.Fragment key={line}>
              <View style={[styles.loginGridVertical, { left: `${line * 20}%` }]} />
              <View style={[styles.loginGridHorizontal, { top: `${line * 20}%` }]} />
            </React.Fragment>
          ))}
        </View>
        <View style={styles.loginBrandIcon}>
          <IconOutline name="comment" size={34} color="#7c4dff" />
        </View>
        <Text style={styles.loginBrandName}>flare IM</Text>
        <Text style={styles.loginBrandTagline}>安全、快速的即时通讯</Text>
      </View>

      <View style={styles.loginPanel}>
        <Text style={styles.loginTitle}>欢迎回来</Text>
        <Text style={styles.loginSubtitle}>请输入您的用户 ID 完成登录</Text>

        <View style={styles.loginFieldGroup}>
          <Text style={styles.loginLabel}>用户 ID</Text>
          <View style={styles.loginInputRow}>
            <IconOutline name="user" size={18} color="#9aa1ad" />
            <TextInput
              accessibilityLabel="用户 ID"
              autoCapitalize="none"
              autoCorrect={false}
              keyboardType="default"
              onChangeText={(userId) => props.onChange({ userId, token: '' })}
              placeholder="11"
              placeholderTextColor="#6f7581"
              returnKeyType="done"
              style={styles.loginTextInput}
              value={props.form.userId}
            />
          </View>
          <View style={styles.loginHintRow}>
            <IconOutline name="info-circle" size={14} color="#7c4dff" />
            <Text style={styles.loginHintText}>Token 将根据用户 ID 自动生成</Text>
          </View>
        </View>

        <View style={styles.loginFieldGroup}>
          <Text style={styles.loginLabel}>连接协议</Text>
          <Pressable
            accessibilityRole="button"
            accessibilityState={{ expanded: transportOpen }}
            onPress={() => setTransportOpen((open) => !open)}
            style={styles.loginSelectRow}
          >
            <View>
              <Text style={styles.loginSelectValue}>{selectedTransport.label}</Text>
              <Text style={styles.loginSelectDetail}>{selectedTransport.detail}</Text>
            </View>
            <IconOutline name={transportOpen ? 'up' : 'down'} size={18} color="#c8ccd5" />
          </Pressable>
          {transportOpen && (
            <View style={styles.loginDropdown}>
              {transportOptions.map((option) => {
                const active = props.form.transportMode === option.mode;
                return (
                  <Pressable
                    accessibilityRole="button"
                    accessibilityState={{ selected: active }}
                    key={option.mode}
                    onPress={() => {
                      props.onChange({ transportMode: option.mode });
                      setTransportOpen(false);
                    }}
                    style={[styles.loginDropdownItem, active && styles.loginDropdownItemActive]}
                  >
                    <Text style={[styles.loginDropdownLabel, active && styles.loginDropdownLabelActive]}>{option.label}</Text>
                    <Text style={styles.loginDropdownDetail}>{option.detail}</Text>
                  </Pressable>
                );
              })}
            </View>
          )}
        </View>

        <Pressable
          accessibilityRole="button"
          accessibilityState={{ expanded: serverOpen }}
          onPress={() => setServerOpen((open) => !open)}
          style={styles.loginDisclosure}
        >
          <Text style={styles.loginDisclosureText}>服务器地址（可选）</Text>
          <IconOutline name={serverOpen ? 'up' : 'down'} size={18} color="#c8ccd5" />
        </Pressable>

        {serverOpen && (
          <View style={styles.loginServerPanel}>
            <LoginConfigInput label="WS" value={props.form.wsUrl} placeholder="ws://127.0.0.1:60051/ws" onChange={(wsUrl) => props.onChange({ wsUrl })} />
            {props.form.transportMode !== 'websocket' && (
              <>
                <LoginConfigInput label="QUIC" value={props.form.quicUrl} placeholder="quic://127.0.0.1:60052" onChange={(quicUrl) => props.onChange({ quicUrl })} />
                <LoginConfigInput label="TLS CA" value={props.form.tlsCaCertPath} placeholder="/path/to/server.crt" onChange={(tlsCaCertPath) => props.onChange({ tlsCaCertPath })} />
              </>
            )}
            <LoginConfigInput label="HTTP" value={props.form.httpUrl} placeholder="http://127.0.0.1:60051" onChange={(httpUrl) => props.onChange({ httpUrl })} />
            <LoginConfigInput label="Data" value={props.form.dataUrl} placeholder="可选 dataUrl" onChange={(dataUrl) => props.onChange({ dataUrl })} />
          </View>
        )}

        <Pressable
          accessibilityRole="button"
          accessibilityState={{ disabled: !canLogin }}
          disabled={!canLogin}
          onPress={props.onLogin}
          style={[styles.loginButton, !canLogin && styles.loginButtonDisabled]}
        >
          <IconOutline name="login" size={18} color="#ffffff" />
          <Text style={styles.loginButtonText}>{props.loading ? '正在登录' : '立即登录'}</Text>
        </Pressable>

        <Text style={styles.loginFootnote}>ID 由管理员分配，可在邀请邮件中查看</Text>
        <Text style={styles.loginFootnote}>仅支持 ID 登录 · 安全连接已启用</Text>
      </View>

      <View style={styles.loginStatusBar}>
        <View style={[styles.loginStatusPill, props.sdkStatus === 'ready' && styles.loginStatusPillReady]}>
          <Text style={styles.loginStatusPillText}>{props.sdkStatus === 'ready' ? '会话活跃' : connectionText(props.sdkStatus)}</Text>
        </View>
        <Text numberOfLines={1} style={styles.loginStatusText}>
          {props.form.userId.trim() || '未登录'} · {selectedTransport.label} · {props.sdkMessage}
        </Text>
      </View>
    </View>
  );
}

function LoginConfigInput(props: {
  label: string;
  value: string;
  placeholder: string;
  onChange: (value: string) => void;
}) {
  return (
    <View style={styles.loginConfigRow}>
      <Text style={styles.loginConfigLabel}>{props.label}</Text>
      <TextInput
        autoCapitalize="none"
        autoCorrect={false}
        onChangeText={props.onChange}
        placeholder={props.placeholder}
        placeholderTextColor="#707783"
        style={styles.loginConfigInput}
        value={props.value}
      />
    </View>
  );
}
