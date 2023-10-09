import {z} from 'zod';

export const ScoutNewFormSchema = z.object({
  // 日付に変換してからバリデーションをかける
  date: z.coerce.date().refine(
    (val) => val !== null, { message: '日付を選択してください' }
  ),
 
   
  // 数値に変換してからバリデーションをかける
  store: z.preprocess(
    (val) => Number(val),
    z
      .number()
      .min(1, { message: '店舗を選択してください' })
  ),
      
  place: z.preprocess(
    (val) => Number(val),
    z
      .number()
      .min(1, { message: '場所を選択してください' })
      .max(4, { message: '値が不正です' }),
  )

});

export type ScoutNewFormSchemaValidate = z.infer<typeof ScoutNewFormSchema>;