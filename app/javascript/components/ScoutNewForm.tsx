import React, { useState } from "react";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod"; 
import {
  Button, Checkbox, Container, FormControl, FormControlLabel, FormGroup, FormHelperText, FormLabel, InputLabel, MenuItem, NativeSelect, Radio, RadioGroup, Select, Stack, TextField
} from '@mui/material';
import dayjs, { Dayjs } from 'dayjs';
import { DemoContainer } from '@mui/x-date-pickers/internals/demo';
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
import { DatePicker } from '@mui/x-date-pickers/DatePicker';

import { ScoutNewFormSchema, ScoutNewFormSchemaValidate } from "../components/validate/ScoutNewFormSchema";
import SearchStore from "../components/SearchStore";
import StoreModal from "../components/StoreModal";


type Props = {
  favoriteStores: any,
}

type TestProps = {
  msg: string,
}

export const ScoutNewForm: React.FC<TestProps> = (props) => {

  // 店舗表示用
  let favoriteStores = JSON.parse(props.favoriteStores);

  // 表示設定、バリデーション
  const [value, setValue] = React.useState<Dayjs | null>(dayjs(new Date()));

  const { register, handleSubmit, formState: { errors } } = useForm<ScoutNewFormSchemaValidate>({
    resolver: zodResolver(ScoutNewFormSchema),
  });

  // 送信
  const onSubmit = (data: ScoutNewFormSchemaValidate) => {
    console.log(data);
  };

  // 店舗検索
  const [searchText, setSearchText] = useState('');
  const [isModalOpen, setIsModalOpen] = useState(false);
  

  const favoriteStoredisplay = (favoriteStores) => {
    openModal();
    console.log(isModalOpen);
  }

  const { Modal, openModal, closeModal } = StoreModal();

  return (
    <Container maxWidth="sm">
      <form onSubmit={handleSubmit(onSubmit)}>
        <Stack spacing={3}>

          <FormControl>
            <InputLabel variant="standard" htmlFor="date"></InputLabel>
            <LocalizationProvider dateAdapter={AdapterDayjs}>
              <DemoContainer components={['DatePicker']}>
                <DatePicker
                  label="日付"
                  {...register("date")}
                  value={value}
                  onChange={(newValue) => setValue(newValue)}
                />
              </DemoContainer>
              <FormHelperText>
              {errors.date && errors.date.message}
            </FormHelperText>
            </LocalizationProvider>
          </FormControl>

          <TextField
              placeholder="店舗検索したい場合は入力してください"
              value={searchText}
              onClick={favoriteStoredisplay}
              {...register("store")}
            >
          </TextField>
            
            <div style={{ margin: '2rem' }}>
              <div>
                <button onClick={openModal}>open modal</button>
              </div>
              <Modal>
                <h2>content from children</h2>
                <button onClick={closeModal}>close</button>
              </Modal>
            </div>

            {/* <SearchStore favoriteStores={favoriteStores} />  */}

          {/* <FormControl>
            <InputLabel>店舗 お気に入り店舗がデフォルトで表示されます</InputLabel>
            <NativeSelect
              defaultValue={0}
              {...register("store")}
            >
              <option value={0}>選択してください</option>
              {favoriteStores.map((store) => (
                <option key={store.id} value={store.id}>{store.name}</option>
              ))}
            </NativeSelect>
          </FormControl> */}

          <FormControl>
          </FormControl>

          <FormControl>
            <InputLabel variant="standard" htmlFor="place">
              場所
            </InputLabel>
            <NativeSelect
              defaultValue={0}
              {...register("place")}
            >
              <option value={0}>選択してください</option>
              <option value={1}>東家</option>
              <option value={2}>南家</option>
              <option value={3}>西家</option>
              <option value={4}>北家</option>
            </NativeSelect>
            <FormHelperText>
              {errors.place && errors.place.message}
            </FormHelperText>
          </FormControl>

          <Button type="submit" color="primary" variant="contained">
            送信
          </Button>


        </Stack>
      </form>
    </Container>
  );
}

export default ScoutNewForm;
